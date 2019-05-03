//
//  LinksTableViewCell.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class LinksTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var linkLabel: UILabel! {
        didSet {
            linkLabel.numberOfLines = 2
        }
    }
    
    var cellModel: Links? {
        didSet {
            guard let cellModel = cellModel else {
                return
            }
            setupUI(cellModel: cellModel)
        }
    }

    private func setupUI(cellModel: Links) {
        
    }

}
