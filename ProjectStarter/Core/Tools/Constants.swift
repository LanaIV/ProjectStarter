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

        struct items {

            struct get {

                let data = "items/"
            }
        }
    }

    struct Colors {

    }

    struct Defaults {

        let cellHeight = 44.0

        let emptyString = ""
    }
    
    struct Fonts {

    }

    struct UserDefauls {

        let realmClasses = "realmClasses"
    }
}
