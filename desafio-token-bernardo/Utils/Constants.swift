//
//  Constants.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/8/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

// Completion for requests
typealias CompletionHandler = (_ Success: Bool) -> ()

enum Constants {
    enum URL {
        static var base = "https://dl.dropboxusercontent.com/s/"
        static var user = "\(Constants.URL.base)fiqendqz4l1xk61/userinfo"
        static var game = "\(Constants.URL.base)1b7jlwii7jfvuh0/games"
    }
    
    enum segue {
        static var toGameDetail = "toGameDetail"
    }
    
    enum reusableCell {
        static var game = "gameCell"
    }
}
