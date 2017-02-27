//
//  TableViewItem.swift
//  feminalink
//
//  Created by Lana on 01/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Realm
import Unbox
import RealmSwift

@objc class TableViewItem: Object, Unboxable, RealmManagerProtocol {

    dynamic var id = 0

    dynamic var creationDate: Date = Date()

    override static func primaryKey() -> String? {
        return "id"
    }

    required init() {
        
        super.init()
    }

    required init(unboxer: Unboxer) throws {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"

        do {
            self.creationDate = try unboxer.unbox(key: "created_at", formatter: dateFormatter)

        } catch {
            print(error)
        }

        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {

        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {

        super.init(value: value, schema: schema)
    }

    func isValid() -> Bool {

        return (self.id != 0)
    }

    static func getMigrationBlock(schemaVersion: Int, oldSchemaVersion: Int) -> MigrationObjectEnumerateBlock {

        for index in 1..<schemaVersion {

            if (oldSchemaVersion >= index) {
                return defaultMigrationBlock
            }

            switch index {

            default:
                return defaultMigrationBlock
            }
        }

        return defaultMigrationBlock
    }
}
