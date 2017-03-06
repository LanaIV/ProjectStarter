//
//  SimpleTVViewModel.swift
//  ProjectStarter
//
//  Created by Lana on 27/02/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import Foundation

import RxSwift

struct SimpleTVViewModel {

    typealias TableViewModelType = SimpleTVTableViewModel

    let disposeBag = DisposeBag()

    let tableViewModel = TableViewModelType()

    func loadData() {

        NetworkManager.sharedInstance.getData()
            .subscribe(
                onNext: { data in

                    guard let value = data as? ItemsArray else {
                        return
                    }

                    self.tableViewModel.elementsVariable.value = value
            },
                onError: { error in
                    print(error)
            })
            .addDisposableTo(disposeBag)
    }

}

//    private func search(query: String) -> Observable<ItemsArray> {
//
//        if query.isEmpty {
//            return itemsVariable.asObservable()
//        }
//
//        return Observable.create { observer in
//
//            let filteredItems = self
//                .itemsVariable
//                .value
//                .filter { (item) -> Bool in
//                    return true//(industry.name.range(of: query) != nil)
//            }
//
//            observer.on(.next(filteredItems))
//
//            return Disposables.create()
//        }
//    }
//    var searchTextVariable = Variable<String>("")
//
//    var searchableItemsObservable = Observable<ItemsArray>.from([])

//    init() {

//        loadData()

//        searchableItemsObservable = searchTextVariable
//            .asObservable()
//            .throttle(0.3, scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .flatMapLatest { query -> Observable<ItemsArray> in
//                return self.search(query: query)
//            }
//            .observeOn(MainScheduler.instance)
//    }
