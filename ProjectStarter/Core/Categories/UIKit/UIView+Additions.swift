//
//  UIView+Additions.swift
//  feminalink
//
//  Created by Lana on 25/01/17.
//  Copyright © 2017 vo2. All rights reserved.
//

import UIKit

extension UIView {

    public static func nibName() -> String {

        return String(describing: self)
    }
    
    public static func view(name: String? = nil) -> Self {

        return view(name: name, type: self)
    }

    public static func view<T: UIView>(name: String? = nil, type: T.Type) -> T {

        var view = T()
        var className = nibName()

        if let name = name {
            className = name
        }

        let nibViews = Bundle.main.loadNibNamed(className, owner: nil, options: nil)

        if let nibFirstView = nibViews?.first as? T {
            view = nibFirstView
        }

        return view
    }

    public func displayFullScreen(view: UIView?) {

        guard let contentView = view else {
            return
        }

        self.addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false;

        self.addFullScreenFillingContraints(toContentView: contentView)
    }

    public func addFullScreenFillingContraints(toContentView: UIView) {

        let centerXConstraint: NSLayoutConstraint = NSLayoutConstraint(containerView: self,
                                                                       attribute: .centerX,
                                                                       toContentView: toContentView)

        let centerYConstraint: NSLayoutConstraint = NSLayoutConstraint(containerView: self,
                                                                       attribute: .centerY,
                                                                       toContentView: toContentView)

        let widthConstraint: NSLayoutConstraint = NSLayoutConstraint(containerView: self,
                                                                     attribute: .width,
                                                                     toContentView: toContentView)

        let heightConstraint: NSLayoutConstraint = NSLayoutConstraint(containerView: self,
                                                                      attribute: .height,
                                                                      toContentView: toContentView)

        self.addConstraints([centerXConstraint, centerYConstraint, widthConstraint, heightConstraint])
    }

    public func localize() {

        switch self {

        case let button as UIButton:

            guard let titleForStateNormal = button.title(for: UIControlState.normal), let titleForStateSelected = button.title(for: UIControlState.selected) else {
                    return
            }

            button.setTitle(NSLocalizedString(titleForStateNormal
                , comment: titleForStateNormal
            ), for: UIControlState.normal)

            button.setTitle(NSLocalizedString(titleForStateSelected, comment: titleForStateSelected), for: UIControlState.selected)

            break

        case let textField as UITextField:

            guard let placeholder = textField.placeholder else {
                return
            }

            textField.placeholder = NSLocalizedString(placeholder, comment: placeholder)

            break

        case let label as UILabel:

            guard let text = label.text else {
                return
            }

            label.text = NSLocalizedString(text, comment: text)

            break

        case let tabBar as UITabBar:

            guard let items = tabBar.items else {
                return
            }

            items.forEach { item in

                guard let title = item.title else {
                    return
                }

                item.title = NSLocalizedString(title, comment: title)
            }

            break

        default:

            guard !subviews.isEmpty else {
                return
            }

            subviews.forEach { subview in
                subview.localize()
            }

            break

        }
    }

}
