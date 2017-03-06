//
//  CellViewModelType.swift
//  ProjectStarter
//
//  Created by Lana on 01/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import Foundation

protocol CellViewModelType {

    associatedtype ElementType

    var element: ElementType { get }

    init(element: ElementType)
}
