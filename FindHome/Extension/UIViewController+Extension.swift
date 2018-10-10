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
        navigationController?.navigationBar.isHidden = false;
        navigationController?.navigationBar.barTintColor = Colors.masterColor;
        navigationController?.navigationBar.tintColor = UIColor.white;
    }

}
