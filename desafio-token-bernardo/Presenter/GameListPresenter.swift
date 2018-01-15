//
//  GameListPresenter.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/15/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

protocol GameListPresentation {
    func requestGames()
}

class GameListPresenter {
    
    var viewController: GameListView!
    
    func mapGames(_ games: [Game]) -> GameListViewModel {
        
        var mappedGames = [GameViewModel]()
        
        for game in games {
            let name = game.name!
            let imageURL = game.image!
            let releaseDate = game.releaseDate!
            let trailerURL = game.trailer!
            let platforms = game.platforms!.joined(separator: ", ")
            
            let mappedGame = GameViewModel(name: name, imageURL: imageURL, releaseDate: releaseDate, trailerURL: trailerURL, platforms: platforms)
            mappedGames.append(mappedGame)
        }
        return GameListViewModel(games: mappedGames)
    }
}

extension GameListPresenter: GameListPresentation {
    
    func requestGames() {
        GameService.instance.getGames { (success) in
            if success {
                let games = GameService.instance.games
                if games.count > 0 {
                    self.viewController.updateView(self.mapGames(games))
                } else {
                    // error
                }
            } else {
                // error
            }
        
        }
    }
}

