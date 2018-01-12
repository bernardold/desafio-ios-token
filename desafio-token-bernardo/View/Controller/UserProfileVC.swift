//
//  UserProfileVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/9/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import SWRevealViewController

protocol UserView {
    func updateView(_ viewModel: UserViewModel)
}

class UserProfileVC: UIViewController, UserView {

    @IBOutlet weak var profileImage: CircleImage!
    @IBOutlet weak var nameLastname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var fullAddress: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: UserPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 80
        presenter.requestUser()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let presenter = UserPresenter()
        presenter.viewController = self
        self.presenter = presenter
    }
    
    func updateView(_ viewModel: UserViewModel) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false;
        
        let url = URL(string: viewModel.user.avatar)
        
        if let data = try? Data(contentsOf: url!) {
            profileImage.image = UIImage(data: data)
        } else {
            profileImage.image = UIImage(named: "profileDefault")
        }
        
        nameLastname.text = viewModel.user.fullName
        email.text = viewModel.user.email
        birthdate.text = viewModel.user.formattedBirthday
        fullAddress.text = viewModel.user.fullAddress
        
        activityIndicator.isHidden = true;
        activityIndicator.stopAnimating()
    }
}
