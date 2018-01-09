//
//  GameListVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/9/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import SWRevealViewController

class GameListVC: UIViewController {
    
    @IBOutlet weak var profileBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlideoutView()
    }

    func setupSlideoutView() {
        profileBtn.target = self.revealViewController()
        profileBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
    }
}
