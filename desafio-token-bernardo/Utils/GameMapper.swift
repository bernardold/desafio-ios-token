//
//  GameMapper.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/16/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

extension Game {
    func map() -> GameViewModel {
        let platforms = self.platforms.map { (platform) -> String in
            platform.rawValue
        }.joined(separator: ", ")
        
        let videoURL = self.trailer
        let idx = videoURL.index(after: videoURL.index(of: "=")!)
        let videoID = String(videoURL[idx...])

        return GameViewModel(name: name, imageURL: image, releaseDate: releaseDate, youtubeVideoID: videoID, platforms: platforms)
    }
}
