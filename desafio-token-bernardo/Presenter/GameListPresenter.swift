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
    func selectGame(withIndex: IndexPath)
}

class GameListPresenter {
    var viewController: GameListView!
    
    func mapGames(_ games: [Game]) -> GameListViewModel {
        var mappedGames = [GameViewModel]()
        
        for game in games {
           let mappedGame = game.map()
            mappedGames.append(mappedGame)
        }
        return GameListViewModel(games: mappedGames)
    }
}

extension GameListPresenter: GameListPresentation {
    
    func requestGames() {
        viewController.startLoading()
        GameService.instance.getGames { (success) in
            if success {
                let games = GameService.instance.games
                if games.count > 0 {
                    self.viewController.updateView(self.mapGames(games))
                    self.viewController.stopLoading()
                } else {
                    // error
                }
            } else {
                // error
            }
        
        }
    }
    
    func selectGame(withIndex: IndexPath) {
        GameService.instance.selectedGame = GameService.instance.games[withIndex.row]
        viewController.showGameDetail()
    }
}

