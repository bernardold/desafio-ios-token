//
//  Game.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/9/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

enum Platform: String {
    case PC
    case MAC
    case LNX
    case PS3
    case PS4
    case XONE
    case X360
    case NS
    case Android
    case iOS
}

struct Game {
    public private(set) var  id: Int
    public private(set) var  name: String
    public private(set) var  image: String
    public private(set) var  releaseDate: String
    public private(set) var  trailer: String
    public private(set) var  platforms: [Platform]
}
