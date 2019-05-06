//
//  LinksViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit
import SafariServices

class LinksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var linksTableView: UITableView!

    let imageArray = [#imageLiteral(resourceName: "github-icon"), #imageLiteral(resourceName: "linkedin-icon"), #imageLiteral(resourceName: "skype-icon")]
    let links = Links()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let index = linksTableView.indexPathForSelectedRow {
            linksTableView.deselectRow(at: index, animated: true)
        }
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = linksTableView.dequeueReusableCell(withIdentifier: LinksTableViewCell.identifier, for: indexPath) as? LinksTableViewCell else {
            return UITableViewCell()
        }
        cell.iconImageView.image = imageArray[indexPath.row]
        cell.linkLabel.text = links.linksArray[indexPath.row]
        return cell
    }

    // MARK: - Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: links.linksArray[indexPath.row]) else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
        // Checking for an internet connection
        if Reachability.isConnectedToNetwork() {
            print("Connected")
        } else {
            showDefaultAlert(title: "Sorry", message: "You have no internet connection.")
        }
    }

    private func setupUI() {
        linksTableView.dataSource = self
        linksTableView.delegate = self
        //Register for LinksTableViewCell.xib
        linksTableView.register(UINib(nibName: LinksTableViewCell.identifier, bundle: .none), forCellReuseIdentifier: LinksTableViewCell.identifier)
        linksTableView.tableFooterView = UIView(frame: .zero)
    }

}
