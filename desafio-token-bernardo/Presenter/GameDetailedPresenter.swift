//
//  GameDetailedPresenter.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/15/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

protocol GameDetailedPresentation {
    func getGameToDisplay()
}

class GameDetailedPresenter {
    
    var viewController: GameDetailedVC!
    
    func mapGame(_ game: Game) -> GameViewModel {
        return GameMapper.map(game)
    }
}

extension GameDetailedPresenter: GameDetailedPresentation {
    func getGameToDisplay() {
        viewController.updateView(self.mapGame(GameService.instance.selectedGame))
    }
}
