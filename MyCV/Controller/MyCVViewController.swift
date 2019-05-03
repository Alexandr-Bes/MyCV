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
    let generalInfo = GeneralInfo()
    let keyInfo = KeyInfo()
    let expInfo = Experience()
    let coursesInfo = Courses()

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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            break
        }
        return section
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = myCVTableView.dequeueReusableCell(withIdentifier: MyCVTableViewCell.identifier, for: indexPath) as? MyCVTableViewCell else {
                return UITableViewCell()
            }
            cell.cellModel = generalInfo
            return cell
        case 1:
            guard let cell = myCVTableView.dequeueReusableCell(withIdentifier: KeyInfoCell.identifier, for: indexPath) as? KeyInfoCell else {
                return UITableViewCell()
            }
            cell.cellModel = keyInfo
            return cell
        case 2:
            guard let cell = myCVTableView.dequeueReusableCell(withIdentifier: ExperienceAndCoursesCell.identifier, for: indexPath) as? ExperienceAndCoursesCell else {
                return UITableViewCell()
            }
            cell.cellModelExp = expInfo
            return cell
        default:
            break
        }

        guard let cell = myCVTableView.dequeueReusableCell(withIdentifier: ExperienceAndCoursesCell.identifier, for: indexPath) as? ExperienceAndCoursesCell else {
            return UITableViewCell()
        }
        cell.cellModelCourses = coursesInfo
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "General Information"
        case 1:
            return "Key Information"
        case 2:
            return "Experience"
        case 3:
            return "Courses"
        default:
            break
        }
        return ""
    }

    // MARK: Private Methods
    private func setupUI() {
        myCVTableView.dataSource = self
        myCVTableView.register(UINib(nibName: MyCVTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MyCVTableViewCell.identifier)
        myCVTableView.register(UINib(nibName: KeyInfoCell.identifier, bundle: nil), forCellReuseIdentifier: KeyInfoCell.identifier)
        myCVTableView.register(UINib(nibName: ExperienceAndCoursesCell.identifier, bundle: nil), forCellReuseIdentifier: ExperienceAndCoursesCell.identifier)
    }


}

