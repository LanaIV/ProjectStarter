//
//  RealmManager.swift
//  feminalink
//
//  Created by Lana on 23/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import RealmSwift

protocol RealmManagerProtocol {

    static var defaultMigrationBlock: MigrationObjectEnumerateBlock { get }

    /**
     change databases fields:
     let field1 = oldObject!["field1"] as! String
     let field2 = oldObject!["field2"] as! String
     newObject!["field"] = "\(field1) \(field2)"

     rename a field:
     migration.renameProperty(onType: ObjectClass.className(), from: "oldField", to: "newField")

     add new field to database with default value for existing entries:
     newObject!["field"] = ""
     
     change representation of or reintroduce a field:
     let field = oldObject!["field"] as! String
     newObject!["field"] = transformationMethod(field)
     */
    static func getMigrationBlock(schemaVersion: Int, oldSchemaVersion: Int) -> MigrationObjectEnumerateBlock
}

extension RealmManagerProtocol {

    static var defaultMigrationBlock: MigrationObjectEnumerateBlock {
        return {_,_ in }
    }
}

@objc class RealmManager: NSObject {

    static let sharedInstance = RealmManager()

    let migrationBlock:MigrationObjectEnumerateBlock = {_,_ in }

    func performMigration(schemaVersion: Int) {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: UInt64(schemaVersion),
            migrationBlock: { migration, oldSchemaVersion in

                guard let realmClasses = UserDefaults.standard.array(forKey: Constants.UserDefauls().realmClasses) as? [String] else {
                    return;
                }

                for realmClass in realmClasses {

                    let type = realmClass

                    let migrationBlock = self.getMigrationBlock(type: type, schemaVersion: schemaVersion, oldSchemaVersion: Int(oldSchemaVersion))

                    migration.enumerateObjects(ofType: type, migrationBlock)
                }
        })

        do {
            let realm = try Realm()

            let realmClasses = realm.schema.objectSchema.map {(objectSchema: ObjectSchema) -> String in
                return objectSchema.className
            }

            UserDefaults.standard.setValue(realmClasses, forKey: Constants.UserDefauls().realmClasses)

        } catch {
            print(error)
        }
    }

    func getMigrationBlock(type: String, schemaVersion: Int, oldSchemaVersion: Int) -> MigrationObjectEnumerateBlock {

        switch type {

        case CatItem.className():

            return CatItem.getMigrationBlock(schemaVersion: schemaVersion, oldSchemaVersion: oldSchemaVersion)

        case Source.className():

            return Source.getMigrationBlock(schemaVersion: schemaVersion, oldSchemaVersion: oldSchemaVersion)

            
        default:
            return migrationBlock
        }
    }

}
