//
//  ExperienceAndCoursesCell.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class ExperienceAndCoursesCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!{
        didSet {
            nameLabel.numberOfLines = 3
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }

    var cellModelExp: Experience? {
        didSet {
            guard let cellModel = cellModelExp else { return }
            setupExpUI(cellModel: cellModel)
        }
    }

    var cellModelCourses: Courses? {
        didSet {
            guard let cellModel = cellModelCourses else { return }
            setupCoursesUI(cellModel: cellModel)
        }
    }

    private func setupExpUI(cellModel: Experience) {
        nameLabel.text = cellModel.position
        descriptionLabel.text = cellModel.workDescription
    }

    private func setupCoursesUI(cellModel: Courses) {
        nameLabel.text = cellModel.engCourse
        descriptionLabel.text = cellModel.engCourseDescription
    }

    
}
