//
//  Routes.swift
//  feminalink
//
//  Created by Lana on 10/02/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {

    case getTableViewData()
    
    static var baseURLString = Constants.ApiPaths().apiUrl

    var method: HTTPMethod {

        switch self {
        case .getTableViewData:
            return .get
        }
    }

    var path: String {

        switch self {
        case .getTableViewData:
            return Constants.ApiPaths.TableView.get().simpleTableViewData
        }
    }

    func asURLRequest() throws -> URLRequest {

        let url = try Router.baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
