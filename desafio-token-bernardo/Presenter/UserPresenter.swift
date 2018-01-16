//
//  UserPresenter.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

//  Procotol who decides whose methods will be shown to the UserViewController
protocol UserPresentation {
    func requestUser()
}

class UserPresenter: UserPresentation {
    var viewController: UserView!
    
    func mapUser(_ user: User) -> UserViewModel {
        let fullName = "\(user.name) \(user.lastname)"
        let fullAddress = "\(user.address) - \(user.city) - \(user.country)"
        
        // Formatting Date
        var formattedBD = ""
        let isoFormatter = ISO8601DateFormatter()
        if let bd = isoFormatter.date(from: user.birthday) {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            formattedBD = formatter.string(from: bd)
        }
        
        let mappedUser = UserViewModel(fullName: fullName, avatar: user.avatar, email: user.email, formattedBirthday: formattedBD, fullAddress: fullAddress)
        return mappedUser
    }
    
    func requestUser() {
        viewController.startLoading()
        UserService.instance.getLoggedUser { (success) in
            if success {
                if let user = UserService.instance.loggedUser {
                    self.viewController.updateView(self.mapUser(user))
                    self.viewController.stopLoading()
                } else {
                    // error
                }
            } else {
                // error
            }
        }
    }
    
}
