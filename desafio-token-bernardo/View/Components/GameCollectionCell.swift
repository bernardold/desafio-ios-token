//
//  GameCollectionCell.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/16/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Kingfisher
import DeviceKit

class GameCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell (_ game: GameViewModel) {
        let device = Device()
        if device.isPad {
            titleLabel.textAlignment = .left
        }
        titleLabel.text = game.name

        let url = URL(string: game.imageURL)
        let image = #imageLiteral(resourceName: "gameDefault")
        thumbnailImage.kf.setImage(with: url, placeholder: image)
        
    }
}
