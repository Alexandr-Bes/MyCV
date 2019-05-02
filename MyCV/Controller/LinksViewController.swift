//
//  LinksViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class LinksViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var linksTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = linksTableView.dequeueReusableCell(withIdentifier: LinksTableViewCell.identifier, for: indexPath) as? LinksTableViewCell else {
            return UITableViewCell()
        }
        cell.linkNameLabel.text = "GitHub"
        cell.linkLabel.text = "https://github.com/Alexandr-Bes"
        return cell
    }

    private func setupUI() {
        linksTableView.dataSource = self
        //Register for LinksTableViewCell.xib
        linksTableView.register(UINib(nibName: LinksTableViewCell.identifier, bundle: .none), forCellReuseIdentifier: LinksTableViewCell.identifier)
    }

}
