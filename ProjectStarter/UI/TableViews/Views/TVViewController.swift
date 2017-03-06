//
//  TVViewController.swift
//  ProjectStarter
//
//  Created by Lana on 28/02/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

class TVViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    @IBAction func simpleTVButtonClicked(_ sender: UIButton) {

        let viewController = SimpleTVViewController(viewModel: SimpleTVViewModel())

        self.push(viewController: viewController)
    }
}
