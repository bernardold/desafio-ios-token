//
//  GameVM.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/15/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

struct GameViewModel {
    let name: String!
    let imageURL: String!
    let releaseDate: String!
    let trailerURL: String!
    let platforms: String!
}

struct GameListViewModel {
    var games: [GameViewModel]
}
