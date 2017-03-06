//
//  NetworkManager+Data.swift
//  feminalink
//
//  Created by Lana on 13/02/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Unbox
import RxSwift
import Alamofire

typealias ItemsArray = Array<CatItem>

extension NetworkManager {

    func getData() -> Observable<Any> {

        return Observable.create { observer in

            self.execute(urlRequest: Router.getData())
                .subscribe(
                    onNext: { result in
                        self.handleGetDataResult(observer: observer, result: result)
                    },
                    onError: { error in
                        self.handleError(observer: observer, error: error)
                    })
        }
    }

    private func handleGetDataResult(observer: AnyObserver<Any>, result: Any?) {

        guard let result = result as? ResponseDictionary else {
            handleError(observer: observer)

            return
        }

        do {
            let items: ItemsArray = try unbox(dictionary: result, atKey: "items")

            observer.on(.next(items))

        } catch {
            print(error)

            handleError(observer: observer)
        }
    }

}
