//
//  GameMapper.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/16/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

class GameMapper {
    
    static func map(_ game: Game) -> GameViewModel {
        let name = game.name
        let imageURL = game.image
        let releaseDate = game.releaseDate
        let trailerURL = game.trailer
        let platforms = game.platforms.joined(separator: ", ")
        
        return GameViewModel(name: name, imageURL: imageURL, releaseDate: releaseDate, trailerURL: trailerURL, platforms: platforms)
    }
}
