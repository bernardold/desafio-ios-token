//
//  CircleImage.swift
//  desafio-token-bernardo
//
//  Created by Bernardo Duarte on 1/11/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
