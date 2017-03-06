//
//  CellType.swift
//  ProjectStarter
//
//  Created by Lana on 01/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import Foundation

protocol CellType {

    associatedtype ViewModelType

    func configure(viewModel: ViewModelType)
}
