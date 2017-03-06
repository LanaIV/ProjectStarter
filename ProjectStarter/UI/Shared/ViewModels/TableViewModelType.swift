//
//  TableViewModelType.swift
//  ProjectStarter
//
//  Created by Lana on 02/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import Foundation

import RxSwift
import RxDataSources

protocol TableViewModelType {

    associatedtype ViewModelsArrayType
    associatedtype SectionModelsArrayType

    associatedtype CustomSectionModelType: SectionModelType

    var sectionModelsVariable: Variable<SectionModelsArrayType> { get }

    var dataSource: RxTableViewSectionedReloadDataSource<CustomSectionModelType> { get }

}
