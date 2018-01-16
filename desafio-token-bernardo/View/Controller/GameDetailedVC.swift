//
//  GameDetailedVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/15/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Kingfisher

protocol GameDetailedView {
    func updateView(_ viewModel: GameViewModel)
}

class GameDetailedVC: UIViewController {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var platformsLabel: UILabel!
    
    var presenter: GameDetailedPresentation!
    var externalTrailerURL: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.getGameToDisplay()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let presenter = GameDetailedPresenter()
        presenter.viewController = self
        self.presenter = presenter
    }
    
    @IBAction func trailerPressed(_ sender: Any) {
        if let url = URL(string: self.externalTrailerURL) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

extension GameDetailedVC: GameDetailedView {
    func updateView(_ viewModel: GameViewModel) {
        self.title = viewModel.name

        let url = URL(string: viewModel.imageURL)
        let image = #imageLiteral(resourceName: "gameDefault")
        gameImage.kf.setImage(with: url, placeholder: image)
        
        releaseDateLabel.text = viewModel.releaseDate
        platformsLabel.text = viewModel.platforms
        externalTrailerURL = viewModel.trailerURL
    }
}
