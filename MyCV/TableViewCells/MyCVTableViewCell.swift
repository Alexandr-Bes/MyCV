//
//  MyCVTableViewCell.swift
//  MyCV
//
//  Created by Alexandr on 5/2/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class MyCVTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var myPhotoImageView: UIImageView!

    var cellModel: GeneralInfo? {
        didSet {
            guard let cellModel = cellModel else { return }
            setupUI(cellModel: cellModel)
        }
    }

    private func setupUI(cellModel: GeneralInfo) {
        let attributedTextName = NSMutableAttributedString(string: "Name: ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        attributedTextName.append(NSMutableAttributedString(string: cellModel.name, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]))
        nameLabel.attributedText = attributedTextName
        let attributedTextPhone = NSMutableAttributedString(string: "Phone: ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        attributedTextPhone.append(NSMutableAttributedString(string: cellModel.phone, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]))
        phoneLabel.attributedText = attributedTextPhone
        let attributedTextEmail = NSMutableAttributedString(string: "Email: ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        attributedTextEmail.append(NSMutableAttributedString(string: cellModel.email, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]))
        emailLabel.attributedText = attributedTextEmail
        myPhotoImageView.image = #imageLiteral(resourceName: "Photo-Cropped")
    }
    
}
