//
//  MyCVViewController.swift
//  MyCV
//
//  Created by Alexandr on 4/30/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit
import SafariServices

class MyCVViewController: UIViewController, UITableViewDataSource {

    // MARK: - Properties
    private struct Constants {
        static let walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        static let walkthroughContentVCId = "WalkthroughContentViewController"
        static let walkthroughVCId = "WalkthroughViewController"
    }

    // MARK: - Outlets
    @IBOutlet weak var myCVTableView: UITableView!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if UserDefaults.standard.bool(forKey: "ViewedWalkthrough") {
            return
        }
        guard let walkthroughVC = Constants.walkthroughStoryboard.instantiateViewController(withIdentifier: Constants.walkthroughVCId) as? WalkthroughViewController else { return }
        present(walkthroughVC, animated: true, completion: nil)
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

    // MARK: Private Methods
    private func setupUI() {
        myCVTableView.dataSource = self
    }


    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Hello World!")
    }

}

