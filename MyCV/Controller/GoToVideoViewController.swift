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
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }

    private func displayMessage(_ userMessage: String) -> Void {
        let alertController = UIAlertController(title: "Oops", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
