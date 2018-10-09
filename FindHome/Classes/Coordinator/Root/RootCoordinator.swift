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
    var account: UserAccount? ;
    
//    private(set) lazy var mainCoordinator = MainCoordinator(output: self);
    var navigationController: UINavigationController?
    
    init() {
        factory = RootFactory();
        rootVC = UIViewController();
        navigationController = UINavigationController()
        
        account?.email = defaults.string(forKey: "email");
        account?.password = defaults.string(forKey: "password");
    }
    
    
    func start(with window: UIWindow?) {
        rootVC = factory.welcomeViewController(output: self)
        self.navigationController = UINavigationController(rootViewController: rootVC);
        window?.rootViewController = self.navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible();
        
    }
    
    func showWelcomeViewController(){
        navigationController?.popToRootViewController(animated: true);
    }
//    func startMain() {
//        let viewController = mainCoordinator.start();
//        rootVC.navigationController?.pushViewController(viewController, animated: true)
//    }
    
    func showAllPostViewController(){
        let viewController = factory.allPostViewController(output: self);
        self.navigationController?.pushViewController(viewController, animated: true);
        
    }
    
    func showLoginViewController(){
        let viewController = factory.loginViewController(output: self, account: account);
        self.navigationController?.pushViewController(viewController, animated: true);
    }
}

//MARK: - WelcomeOutput
extension RootCoordinator: WelcomeOutput{
    func welcome(showAllPost: Any?) {
        showAllPostViewController();
    }
    
    func welcome(showHistory: Any?) {
        showLoginViewController()
    }
    
    func welcome(showAccount: Any?) {
//        if Check.checkAll.isLogin{
            showLoginViewController()
//        } else{
        
//        }
    }
    
    func welcome(showMore: Any?) {
        
    }
    
    
    func welcome() {
        
    }
    
}

//MARK: - MainCoordinatorOutput
//extension RootCoordinator: MainCoordinatorOutput{
//}


//MARK: - AllPostOutput
extension RootCoordinator: AllPostOutput{
}

//MARK: - LoginOutput
extension RootCoordinator: LoginOutput{
    func showPhoneNumberViewController() {
        
    }
    
    func showHome() {
        showWelcomeViewController();
    }
    
}


//MARK: - UI
extension RootCoordinator{
    
    func initUINavigation() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white];
        self.navigationController?.navigationBar.tintColor = Colors.masterColor
        
    }
}

