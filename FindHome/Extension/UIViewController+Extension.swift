//
//  UIViewController+Extension.swift
//  FindHome
//
//  Created by TaNhi on 10/4/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func setTitleNavigation(title: String){
        self.navigationItem.title = title;
//        self.navigationController?.navigationBar.backgroundColor = Colors.masterColor;
        self.navigationController?.navigationBar.tintColor = Colors.masterColor;
        navigationController?.navigationBar.isHidden = false;
        navigationController?.navigationBar.tintColor = Colors.masterColor;
        
    }

}
