//
//  ViewController.swift
//  MyCV
//
//  Created by Alexandr on 4/30/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.center = view.center
        activity.startAnimating()
        view.addSubview(activity)

        let image = #imageLiteral(resourceName: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.frame = self.view.frame
        view.addSubview(imageView)
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Hello")
    }

}

