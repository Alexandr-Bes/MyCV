//
//  KeyInfoCell.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class KeyInfoCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var firstLabel: UILabel! {
        didSet {
            firstLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var secondLabel: UILabel! {
        didSet {
            secondLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel! {
        didSet {
            fourthLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel! {
        didSet {
            sixthLabel.numberOfLines = 2
        }
    }

    var cellModel: KeyInfo? {
        didSet {
            guard let cellModel = cellModel else { return }
            setupUI(cellModel: cellModel)
        }
    }

    private func setupUI(cellModel: KeyInfo) {
        firstLabel.text = "∙ " + cellModel.firstLine
        secondLabel.text = "∙ " + cellModel.secondLine
        thirdLabel.text = "∙ " + cellModel.thirdLine
        fourthLabel.text = "∙ " + cellModel.fourthLine
        fifthLabel.text = "∙ " + cellModel.fifthLine
        sixthLabel.text = "∙ " + cellModel.sixthLine
    }
    
}
