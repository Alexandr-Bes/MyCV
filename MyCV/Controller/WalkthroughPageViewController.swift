//
//  WalkthroughPageViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/2/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    // MARK: - Properties
    private var pageHeaders = [String]()
    private var pageBodyText = [String]()
    private var pageContentImage = #imageLiteral(resourceName: "walthr")
    private var currentIndex = 0
    private var walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
    private var walkthroughContentViewControllerID = "WalkthroughContentViewController"

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Page View Controller Data Source Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1

        return contentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1

        return contentViewController(at: index)
    }

    // MARK: - Private methods
    private func setupUI() {

    }

    private func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeaders.count {
            return nil
        }

        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: walkthroughContentViewControllerID) as? WalkthroughContentViewController {
            pageContentViewController.headerText = pageHeaders[index]
            pageContentViewController.bodyText = pageBodyText[index]
            pageContentViewController.index = index

            return pageContentViewController
        }

        return nil
    }

    // MARK: - Navigation

}
