//
//  UIViewController+Navigation.swift
//  ProjectStarter
//
//  Created by Lana on 28/02/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

extension UIViewController {

    func display(viewController: UIViewController, inView: UIView) {

        self.displayFullScreen(viewController: viewController, inContainerView: inView)
    }

    func push(viewController: UIViewController) {

        if let navigationController = navigationController {
            navigationController.pushViewController(viewController, animated: true)
        }
    }

}
