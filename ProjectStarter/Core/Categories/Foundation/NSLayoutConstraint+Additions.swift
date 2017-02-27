//
//  NSLayoutConstraint+Additions.swift
//  feminalink
//
//  Created by Lana on 26/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import UIKit
import Foundation

public extension NSLayoutConstraint {

    public convenience init(containerView: UIView, attribute: NSLayoutAttribute, toContentView: UIView) {

        self.init(item: containerView,
                  attribute: attribute,
                  relatedBy: .equal,
                  toItem: toContentView,
                  attribute: attribute,
                  multiplier: 1.0,
                  constant: 0)
    }

}
