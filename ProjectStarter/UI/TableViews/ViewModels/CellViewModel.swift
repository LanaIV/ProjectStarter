//
//  CellViewModel.swift
//  ProjectStarter
//
//  Created by Lana on 01/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import Foundation

struct CellViewModel: CellViewModelType {

    typealias ElementType = CatItem

    var element: ElementType

    init(element: ElementType) {

        self.element = element
    }
}
