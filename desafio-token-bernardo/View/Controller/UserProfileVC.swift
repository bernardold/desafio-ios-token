//
//  UserProfileVC.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/9/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import SWRevealViewController
import Kingfisher

protocol UserView {
    func updateView(_ viewModel: UserViewModel)
    func startLoading()
    func stopLoading()
}

class UserProfileVC: UIViewController {
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
}

extension UserProfileVC: UserView {
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    func updateView(_ viewModel: UserViewModel) {
        let url = URL(string: viewModel.avatar)
        let image = #imageLiteral(resourceName: "profileDefault")
        profileImage.kf.setImage(with: url, placeholder: image)
        
        nameLastname.text = viewModel.fullName
        email.text = viewModel.email
        birthdate.text = viewModel.formattedBirthday
        fullAddress.text = viewModel.fullAddress
    }
}
