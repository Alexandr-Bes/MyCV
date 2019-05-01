//
//  WalkthroughViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/1/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var headerLabel: UILabel! {
        didSet {
            headerLabel.numberOfLines = 1
        }
    }

    @IBOutlet var bodyTextLabel: UILabel! {
        didSet {
            bodyTextLabel.numberOfLines = 0
        }
    }

    @IBOutlet var contentImageView: UIImageView!

    // MARK: - Properties
    var index = 0
    var headerText = ""
    var bodyText = ""
    var contentImage = #imageLiteral(resourceName: "walthr")

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    // MARK: - Private methods
    private func setupUI() {
        headerLabel.text = headerText
        bodyTextLabel.text = bodyText
        contentImageView.image = contentImage
    }

    
    // MARK: - Navigation

}
