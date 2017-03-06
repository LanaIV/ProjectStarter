//
//  SimpleTVViewController.swift
//  ProjectStarter
//
//  Created by Lana on 27/02/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

class SimpleTVViewController: UIViewController {

    typealias ViewModelType = SimpleTVViewModel

    @IBOutlet weak var tableViewContainer: UIView!

    var viewModel: ViewModelType!

    convenience init(viewModel: ViewModelType) {

        self.init()

        self.viewModel = viewModel
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        viewModel.loadData()

        setupView()
    }

    private func setupView() {

        let tableViewController = SimpleTableViewController(viewModel: viewModel.tableViewModel)

        self.display(viewController: tableViewController, inView: tableViewContainer)
    }

}
