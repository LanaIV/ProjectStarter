//
//  SimpleTVTableViewModel.swift
//  ProjectStarter
//
//  Created by Lana on 01/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import Foundation

import RxSwift
import RxDataSources

struct SimpleTVTableViewModel: TableViewModelType {

    typealias CustomSectionModelType = SimpleTVSectionModel

    typealias ViewModelsArrayType = Array<SimpleTVSectionItem>

    typealias SectionModelsArrayType = Array<SimpleTVSectionModel>

    let disposeBag = DisposeBag()

    var dataSource: RxTableViewSectionedReloadDataSource<SimpleTVSectionModel>

    var elementsVariable = Variable<ItemsArray>([])

    var sectionModelsVariable = Variable<SectionModelsArrayType>([])

    let tableViewCells = [TableViewCell.self];
    
    init() {

        dataSource = RxTableViewSectionedReloadDataSource<CustomSectionModelType>()

        let _ = elementsVariable
            .asObservable()
            .map { elements in

                let simpleSectionItems: ViewModelsArrayType = elements
                    .map { element in
                        let viewModel = CellViewModel(element: element)

                        return .CellViewModelItem(viewModel: viewModel)
                    }

                let sections = [SimpleTVSectionModel.SimpleSection(title: "", items: simpleSectionItems)]

                return sections
            }
            .bindTo(self.sectionModelsVariable)
            .addDisposableTo(disposeBag)

        dataSource.configureCell = { dataSource, tableView, _, element in

            switch element {

            case .CellViewModelItem:
                
                let cell: TableViewCell = tableView.dequeueReusableCell()

                cell.configure(viewModel: element.viewModel as! CellViewModel)

                return cell
            }
        }
    }
}

enum SimpleTVSectionModel {
    case SimpleSection(title: String, items: [SimpleTVSectionItem])
}

enum SimpleTVSectionItem {
    case CellViewModelItem(viewModel: Any)
}

extension SimpleTVSectionModel: SectionModelType {

    typealias Item = SimpleTVSectionItem

    var items: Array<Item> {

        switch self {

        case .SimpleSection(title: _, items: let items):
            return items.map { $0 }
        }
    }

    init(original: SimpleTVSectionModel, items: Array<Item>) {

        switch original {

        case let .SimpleSection(title: title, items: _):
            self = .SimpleSection(title: title, items: items)
        }
    }
}

extension SimpleTVSectionModel {

    var title: String {

        switch self {

        case .SimpleSection(title: let title, items: _):
            return title
        }
    }
}

extension SimpleTVSectionItem {

    var viewModel: Any {

        switch self {

        case .CellViewModelItem(viewModel: let viewModel):
            return viewModel
        }
    }
}
