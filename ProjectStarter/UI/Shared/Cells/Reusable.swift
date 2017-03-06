//
//  Reusable.swift
//  ProjectStarter
//
//  Created by Lana on 02/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

protocol Reusable: class {

    associatedtype CellViewModelType

    static var nib: UINib? { get }

    static var reuseIdentifier: String { get }

    func configure(viewModel: CellViewModelType)

}

extension Reusable {

    static var nib: UINib? {

        return UINib(nibName: String(describing: self), bundle: nil)
    }

    static var reuseIdentifier: String {

        return String(describing: self)
    }

}
