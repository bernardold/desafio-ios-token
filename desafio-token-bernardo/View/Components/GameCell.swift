//
//  GameCell.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/11/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var platformsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell (_ game: GameViewModel) {
        title.text = game.name!
        platformsLabel.text = game.platforms!
        
        let url = URL(string: game.imageURL)
        if let data = try? Data(contentsOf: url!) {
            thumbnail.image = UIImage(data: data)
        } else {
            thumbnail.image = UIImage(named: "gameDefault")
        }
    }
}
