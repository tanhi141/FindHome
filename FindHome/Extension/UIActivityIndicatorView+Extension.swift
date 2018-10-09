//
//  UIActivityIndicatorView+Extension.swift
//  FindHome
//
//  Created by TaNhi on 10/9/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
import  UIKit

extension UIActivityIndicatorView{

    func show(){
        self.isHidden = false;
        self.startAnimating()
    }
    
    func hide(){
        self.stopAnimating()
        self.isHidden = true;
    }
}
