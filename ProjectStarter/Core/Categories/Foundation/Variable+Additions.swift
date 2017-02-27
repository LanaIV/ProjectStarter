//
//  Variable+Additions.swift
//  feminalink
//
//  Created by Lana on 16/02/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import RxSwift
import RxCocoa

public extension Variable {

    public func twoWayBind<O: ObserverType & ObservableType>(observer: O) -> RxSwift.Disposable where O.E == E {

        let disposable1 = self
            .asObservable()
            .bindTo(observer)

        let disposable2 = observer
            .bindTo(self)

        return CompositeDisposable(disposable1, disposable2)
    }

}
