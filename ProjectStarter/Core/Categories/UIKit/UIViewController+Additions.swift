//
//  UIViewController+Additions.swift
//  feminalink
//
//  Created by Lana on 24/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import UIKit

public extension UIViewController {

    public func displayFullScreen(viewController: UIViewController?) {

        self.displayFullScreen(viewController: viewController, inContainerView: self.view)
    }

    public func displayFullScreen(viewController: UIViewController?, inContainerView: UIView?) {

        guard let contentViewController = viewController, let containerView = inContainerView else {
            return
        }

        self.addChildViewController(contentViewController)

        containerView.displayFullScreen(view: contentViewController.view)

        contentViewController.didMove(toParentViewController:self)
    }

    public func removeFullScreen() {

        willMove(toParentViewController: nil)

        view.removeFromSuperview()

        removeFromParentViewController()
    }

}
