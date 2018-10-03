//
//  RootFactory.swift
//  FindHome
//
//  Created by TaNhi on 10/1/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//


import UIKit

class RootFactory {
    
    func rootViewController() -> UIViewController {
        let viewController = UIViewController();
        return viewController;
    }
    
    func welcomeViewController(output: WelcomeOutput) -> UIViewController{
        let viewController = WelcomeVC();
        viewController.presenter = WelcomePresenter(view: viewController, output: output);
        return viewController
    }
}

