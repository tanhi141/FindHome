//
//  RootCoordinator.swift
//  FindHome
//
//  Created by TaNhi on 10/1/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
import UIKit

class RootCoordinator{
    
    private let factory: RootFactory;
    var rootVC: UIViewController;

    private(set) lazy var mainCoordinator = MainCoordinator(output: self);
    
    init() {
        factory = RootFactory();
        rootVC = factory.rootViewController();
    }
    
    
    func start(with window: UIWindow?) {
        rootVC = factory.welcomeViewController(output: self);
        window?.rootViewController = rootVC;
         startMain()
        window?.makeKeyAndVisible();
    }
    
    func startMain() {
        mainCoordinator.startWithViewController()
    }
}

//MARK: - WelcomeOutput
extension RootCoordinator: WelcomeOutput{
    func welcome(showAllPost: Any?) {
        mainCoordinator.start();
    }
    
    func welcome(showHistory: Any?) {
        
    }
    
    func welcome(showAccount: Any?) {
        
    }
    
    func welcome(showMore: Any?) {
        
    }
    
    
    func welcome() {
        
    }
    
}

//MARK: - MainCoordinatorOutput
extension RootCoordinator: MainCoordinatorOutput{
}
