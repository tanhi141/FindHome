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
    var navigationController: UINavigationController?
    
    init() {
        factory = RootFactory();
        rootVC = UIViewController();
        navigationController = UINavigationController()
    }
    
    
    func start(with window: UIWindow?) {
        self.navigationController = UINavigationController(rootViewController: factory.welcomeViewController(output: self));
                window?.rootViewController = self.navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible();
        
    }
    
//    func startMain() {
//        let viewController = mainCoordinator.start();
//        rootVC.navigationController?.pushViewController(viewController, animated: true)
//    }
    
    func showAllPostViewController(){
        let viewController = factory.allPostViewController(output: self);
        self.navigationController?.pushViewController(viewController, animated: true);
        
    }
}

//MARK: - WelcomeOutput
extension RootCoordinator: WelcomeOutput{
    func welcome(showAllPost: Any?) {
        showAllPostViewController();
//        startMain()
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


//MARK: - AllPostOutput
extension RootCoordinator: AllPostOutput{
}
