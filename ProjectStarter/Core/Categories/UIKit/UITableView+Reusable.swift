//
//  UITableView+Reusable.swift
//  ProjectStarter
//
//  Created by Lana on 02/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

extension UITableView {

    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {

        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }

    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {

        if let nib = T.nib {
            register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>() -> T where T: Reusable {

        return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {

        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
    }

}
