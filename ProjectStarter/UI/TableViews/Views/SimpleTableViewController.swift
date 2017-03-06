//
//  SimpleTableViewController.swift
//  ProjectStarter
//
//  Created by Lana on 01/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

import RxSwift
import RxDataSources

class SimpleTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResultsView: UIView!

    let disposeBag = DisposeBag()

    var viewModel: SimpleTVTableViewModel!

    convenience init(viewModel: SimpleTVTableViewModel) {

        self.init()

        self.viewModel = viewModel
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        setupView()
    }

    func setupView() {

        for cell in viewModel.tableViewCells {
            tableView.registerReusableCell(cell)
        }

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = CGFloat(Constants.Defaults().cellHeight)

        viewModel
            .sectionModelsVariable
            .asObservable()
            .bindTo(tableView.rx.items(dataSource: viewModel.dataSource))
            .addDisposableTo(disposeBag)

        viewModel
            .sectionModelsVariable
            .asObservable()
            .map { $0.count != 0 }
            .bindTo(noResultsView.rx.isHidden)
            .addDisposableTo(disposeBag)
    }

}
