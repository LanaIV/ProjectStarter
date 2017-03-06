//
//  CatItem.swift
//  feminalink
//
//  Created by Lana on 01/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Realm
import Unbox
import RealmSwift

class CatItem: Object, Unboxable, RealmManagerProtocol {

    dynamic var id = 0

    dynamic var imageUrl: String? = ""
    dynamic var title: String? = ""

    dynamic var creationDate: Date? = Date()

    let sources = List<Source>()

    required init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

    required init(unboxer: Unboxer) throws {

        do {

            id = try unboxer.unbox(key: "id")

            let sourcesArray: Array<Source> = try unboxer.unbox(key: "sources")

            sources.append(objectsIn: sourcesArray)
            
        } catch {
            print(error)
        }

        let creationDateTimstamp: Double = try unboxer.unbox(key: "creation_date")

        creationDate = Date(timeIntervalSince1970: creationDateTimstamp)

        imageUrl = unboxer.unbox(key: "image_uri")
        title = unboxer.unbox(key: "title")

        super.init()
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {

        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {

        super.init(value: value, schema: schema)
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

    func className() -> String {
        return CatItem.description()
    }
}
