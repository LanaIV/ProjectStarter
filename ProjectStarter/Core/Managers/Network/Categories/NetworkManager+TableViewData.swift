//
//  NetworkManager+Industries.swift
//  feminalink
//
//  Created by Lana on 13/02/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import Unbox
import RxSwift
import Alamofire

extension NetworkManager {

    func getTableViewData() -> Observable<Any> {

        return Observable.create { observer in

            self.execute(request: Router.getTableViewData())
                .subscribe(
                    onNext: { data in
                        self.handleGetTableViewDataResult(observer: observer, data: data)
                    },
                    onError: { error in
                        self.handleError(observer: observer, error: error)
                    })
        }
    }

    private func handleGetTableViewDataResult(observer: AnyObserver<Any>, data: Any?) {

    }

}
