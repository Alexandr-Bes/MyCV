//
//  GoToVideoViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/2/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class GoToVideoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var playButton: UIButton!

    // MARK: - Actions
    @IBAction func playButtonPressed(_ sender: Any) {
        playVideo()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        playButton.layer.cornerRadius = 12
        playButton.clipsToBounds = true
        showDefaultAlert(title: "Hi there!", message: "Here is the video of my finished projects. To tell the truth, it is the main issue why my project is so big, so just press the play button and enjoy the video 🙃")
    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "movie", ofType: "mov") else {
            debugPrint("Video not found")
            showDefaultAlert(title: "Oops", message: "Something went wrong and unfortunately the video not found 😥")
            return
        }

        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }

}
