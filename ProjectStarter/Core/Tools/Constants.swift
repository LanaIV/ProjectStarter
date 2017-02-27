//
//  Constants.swift
//  feminalink
//
//  Created by Lana on 05/12/16.
//  Copyright © 2016 vo2. All rights reserved.
//

import Foundation

struct Constants {

    struct ApiPaths {

        let apiUrlKey = "APIUrl"

        var apiUrl: String {
            get {
                guard let url = Bundle.main.object(forInfoDictionaryKey:ApiPaths().apiUrlKey) as? String else {
                    return ""
                }

                return url
            }
        }

        struct TableView {

            let tableView = "tableView"

            struct get {

                let simpleTableViewData = "simpleTableView"
            }
        }
    }

    struct Colors {

    }

    struct Defaults {

        let emptyString = ""
    }
    
    struct Fonts {

    }

    struct UserDefauls {

        let realmClasses = "realmClasses"
    }
}
