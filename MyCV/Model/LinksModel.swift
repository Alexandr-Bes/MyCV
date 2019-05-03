//
//  LinksModel.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation

struct Links {
    let skypeLink: String
    let linkedInLink: String
    let gitHubLink: String
    var linksArray = [String]()

    init() {
        self.skypeLink = "Alexandr Bezkopylnyi"
        self.linkedInLink = "https://linkedin.com/in/alex-beskopylnyi"
        self.gitHubLink = "https://github.com/Alexandr-Bes"
        self.linksArray = ["https://github.com/Alexandr-Bes", "https://linkedin.com/in/alex-beskopylnyi", "Alexandr Bezkopylnyi"]
    }
}
