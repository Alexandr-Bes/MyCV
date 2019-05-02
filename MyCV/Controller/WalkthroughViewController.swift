//
//  WalkthroughViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/2/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {

    // MARK: - Outlets
    @IBOutlet var pageControll: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!

    // MARK: - Actions
    @IBAction func skipButtonPressed(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "ViewedWalkthrough")
        dismiss(animated: true, completion: nil)
    }

    @IBAction func nextButtonPressed(sender: UIButton) {
        guard let index = walkthroughPageViewController?.currentIndex else { return }
        switch index {
        case 0, 1:
            walkthroughPageViewController?.nextPage()
        case 2:
            UserDefaults.standard.set(true, forKey: "ViewedWalkthrough")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
        updateUI()
    }

    // MARK: - Properties
    var walkthroughPageViewController: WalkthroughPageViewController?

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Private Methods
    private func updateUI() {
        guard let index = walkthroughPageViewController?.currentIndex else { return }
        switch index {
        case 0, 1:
            nextButton.setTitle("NEXT", for: .normal)
            skipButton.isHidden = false
        case 2:
            nextButton.setTitle("GET STARTED", for: .normal)
            skipButton.isHidden = true
        default:
            break
        }
        pageControll.currentPage = index
    }

    func updatePageIndex(currentIndex: Int) {
        updateUI()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? WalkthroughPageViewController else { return }
        walkthroughPageViewController = destinationVC
        walkthroughPageViewController?.walkthroughDelegate = self
    }

}
