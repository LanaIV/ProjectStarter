//
//  Source.swift
//  feminalink
//
//  Created by Lana on 01/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Realm
import Unbox
import RealmSwift

class Source: Object, Unboxable, RealmManagerProtocol {

    dynamic var creationDate: Date = Date()

    dynamic var itemId: String = ""

    dynamic var siteName: String? = ""
    dynamic var uri: String? = ""

    required init() {
        
        super.init()
    }

    required init(unboxer: Unboxer) throws {

        do {
            itemId = try unboxer.unbox(key: "item_id")
        } catch {
            print(error)
        }

        siteName = unboxer.unbox(key: "site_name")
        uri = unboxer.unbox(key: "uri")

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
}
