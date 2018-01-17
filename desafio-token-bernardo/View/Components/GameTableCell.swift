//
//  GameCell.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/11/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Kingfisher

class GameTableCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var platformsLabel: UILabel!
    
    func configureCell (_ game: GameViewModel) {
        title.text = game.name
        platformsLabel.text = game.platforms
        
        let url = URL(string: game.imageURL)
        let image = #imageLiteral(resourceName: "gameDefault")
        thumbnail.kf.setImage(with: url, placeholder: image)
    }
}
