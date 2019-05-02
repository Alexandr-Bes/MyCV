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

}
