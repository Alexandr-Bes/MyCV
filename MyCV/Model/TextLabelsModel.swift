//
//  TextLabelsModel.swift
//  MyCV
//
//  Created by Alexandr on 5/3/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import Foundation

struct GeneralInfo {
    let name: String
    let phone: String
    let email: String

    init() {
        self.name = "Alexander Bezkopylnyi"
        self.phone = "380663343777"
        self.email = "sanok.bes@gmail.com"
    }
}

struct KeyInfo {
    let firstLine: String
    let secondLine: String
    let thirdLine: String
    let fourthLine: String
    let fifthLine: String
    let sixthLine: String

    init() {
        self.firstLine = "Good knowledge of Swift programming language."
        self.secondLine = "Experience working with such frameworks and libraries: SwiftyJSON, Alamofire, CoreLocation, Firebase, AVKit, AVFoundation, Core Data, etc."
        self.thirdLine = "Knowledge of Auto Layout."
        self.fourthLine = "Understanding of Apple’s design principles and iOS Human Interface Guidelines."
        self.fifthLine = "Experience with Git."
        self.sixthLine = "Knowledge of the main OOP principles, algorithms and data structures."
    }
}

    struct Experience {
        let position: String
        let workDescription: String

        init() {
            self.position = "Junior iOS Developer (3 months)"
            self.workDescription = "Developing a client-server application for showing news, streaming media, a video broadcast on Apple TV/Google Cast."
        }
    }

    struct Courses {
        let swiftCourse: String
        let swiftCourseDescription: String
        let engCourse: String
        let engCourseDescription: String

        init() {
            self.swiftCourse = "Web Academy Kiev: iOS development (Swift)"
            self.swiftCourseDescription = "3 months of studying of iOS development on Swift. Final training project."
            self.engCourse = "English courses"
            self.engCourseDescription = "English level: B1 (Intermediate), confirmed by the certificate of V. N. Karazin Kharkiv National University"
        }
    }

