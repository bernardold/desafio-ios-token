//
//  UserService.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/11/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService {
    static let instance = UserService()
    
    var loggedUser : User?
    
    func getLoggedUser(completion: @escaping CompletionHandler) {
        Alamofire.request(USER_URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = JSON(data)
                
                let name = json["name"].stringValue
                let lastname = json["lastname"].stringValue
                let avatar = json["avatar"].stringValue
                let email = json["email"].stringValue
                let birthday = json["birthday"].stringValue
                let address = json["address"].stringValue
                let city = json["city"].stringValue
                let country = json["country"].stringValue
                let token = json["token"].stringValue
                
                let user = User(name: name, lastname: lastname, avatar: avatar, email: email, birthday: birthday, address: address, city: city, country: country, token: token)
                
                self.setUser(user)
                
                completion(true)
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    func setUser(_ user: User) {
        self.loggedUser = user
    }
}
