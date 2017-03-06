//
//  TableViewCell.swift
//  ProjectStarter
//
//  Created by Lana on 01/03/17.
//  Copyright © 2017 Rizna. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, Reusable {

    typealias CellViewModelType = CellViewModel

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {

        super.awakeFromNib()
    }

    func configure(viewModel: CellViewModelType) {

        titleLabel.text = viewModel.element.title
    }
}
