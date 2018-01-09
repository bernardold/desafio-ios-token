//
//  UserProfileVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/9/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import SWRevealViewController

class UserProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 80

        // Do any additional setup after loading the view.
    }
}
