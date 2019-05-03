//
//  UIViewController+Extension.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
