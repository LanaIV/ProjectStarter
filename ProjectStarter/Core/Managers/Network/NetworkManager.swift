//
//  NetworkManager.swift
//  feminalink
//
//  Created by Lana on 02/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Unbox
import RxSwift
import Alamofire

typealias ParamsDictionary = Dictionary<String, Any>
typealias ResponseDictionary = Dictionary<String, Any>

enum NetworkError: Error {

    case http
    case api
    case jsonParse
    case undefined
}

class NetworkManager {

    static let sharedInstance = NetworkManager()

    let disposeBag = DisposeBag()

    func execute(urlRequest: URLRequestConvertible) -> Observable<Any> {

        return Observable.create { observer in

            let request = Alamofire
                .request(urlRequest)
                .responseJSON { response in

                    if let error = response.error {
                        self.handleError(observer: observer, error: error)

                        return
                    }

                    self.handleResult(observer: observer, result: response.result.value)
            }

            return Disposables.create {
                request.cancel()
            }
        }

    }

    private func handleResult(observer: AnyObserver<Any>, result: Any?) {

        guard let dictionaryData = result as? ResponseDictionary else {

            handleError(observer: observer, error: NetworkError.jsonParse)

            return
        }

        observer.on(.next(dictionaryData))
    }
    
    func handleError(observer: AnyObserver<Any>, error: Error = NetworkError.undefined) {

        observer.on(.error(error))
    }

}
