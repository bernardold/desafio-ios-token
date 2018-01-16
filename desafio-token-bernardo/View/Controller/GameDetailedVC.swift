//
//  GameDetailedVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/15/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

protocol GameDetailedView {
    func updateView(_ viewModel: GameViewModel)
}

class GameDetailedVC: UIViewController {
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var platformsLabel: UILabel!
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    var presenter: GameDetailedPresentation!
    var videoID: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getGameToDisplay()
        youtubePlayer.load(withVideoId: videoID)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let presenter = GameDetailedPresenter()
        presenter.viewController = self
        self.presenter = presenter
    }
}

extension GameDetailedVC: GameDetailedView {
    func updateView(_ viewModel: GameViewModel) {
        self.title = viewModel.name
        
        releaseDateLabel.text = viewModel.releaseDate
        platformsLabel.text = viewModel.platforms
        videoID = viewModel.youtubeVideoID
    }
}
