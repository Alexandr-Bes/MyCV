//
//  WalkthroughPageViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/2/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class {
    func updatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {


    // MARK: - Properties
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    private var pageHeaders = ["Hello!", "", ""]
    private var pageBodyText = ["My name is Alexander and I really admire iOS Development", "I love Apple products, its quality, reliability, design, speed, and many other", "And here is MyCV app that I've created to present to you. Enjoy watching"]
    var currentIndex = 0
    private struct Constants {
        static let walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        static let walkthroughContentVCId = "WalkthroughContentViewController"
        static let walkthroughVCId = "WalkthroughViewController"
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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

    // MARK: - Page View Controller Delegate Methods
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController else { return }
            currentIndex = contentViewController.index
            walkthroughDelegate?.updatePageIndex(currentIndex: currentIndex)
        }
    }

    // MARK: - Private Methods
    private func setupUI() {
        dataSource = self
        delegate = self
        if let firstVC = contentViewController(at: 0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    private func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeaders.count {
            return nil
        }
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: Constants.walkthroughContentVCId) as? WalkthroughContentViewController {
            pageContentViewController.headerText = pageHeaders[index]
            pageContentViewController.bodyText = pageBodyText[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }

    func nextPage() {
        currentIndex += 1
        if let nextVC = contentViewController(at: currentIndex) {
            setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
        }
    }


}
