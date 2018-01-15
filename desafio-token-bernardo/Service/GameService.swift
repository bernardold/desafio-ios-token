//
//  GameService.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/11/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GameService {
    static let instance = GameService()
    
    var games = [Game]()
    
    func getGames(completion: @escaping CompletionHandler) {
        Alamofire.request(GAME_URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                if let json = JSON(data)["games"].array {
                    for game in json {
                        let id = game["id"].intValue
                        let name = game["name"].stringValue
                        let image = game["image"].stringValue
                        let releaseDate = game["release_date"].stringValue
                        let trailer = game["trailer"].stringValue
                        let platforms = game["platforms"].arrayValue.map({$0.stringValue})
                        
                        let newGame = Game(id: id, name: name, image: image, releaseDate: releaseDate, trailer: trailer, platforms: platforms)
                        self.games.append(newGame)
                    }
                    completion(true)
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    func clearGames() {
        self.games.removeAll()
    }
}
