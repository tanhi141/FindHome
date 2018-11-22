//
//  RootFactory.swift
//  FindHome
//
//  Created by TaNhi on 10/1/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//


import UIKit

class RootFactory {
    
    func navigationViewController() -> UINavigationController{
        return UINavigationController();
    }
    
    func rootViewController() -> UIViewController {
        let viewController = UIViewController();
        return viewController;
    }
    
    func welcomeViewController(output: WelcomeOutput) -> UIViewController{
        let viewController = WelcomeVC();
        viewController.presenter = WelcomePresenter(view: viewController, output: output);
        return viewController
    }
    
    func allPostViewController(output: AllPostOutput) -> UIViewController{
        let viewController = AllPostVC();
        viewController.presenter = AllPostPresenter(view: viewController, output: output)
        return viewController
    }
    
    func loginViewController(output: LoginOutput, account: UserAccount?) -> UIViewController{
        let viewController = LoginVC();
        viewController.presenter = LoginPresenter(view: viewController, output: output, userAccount: account)
        return viewController
    }
    
    func registerViewController(output: RegisterOutput) -> UIViewController{
        let viewController = RegisterVC();
        viewController.presenter = RegisterPresenter(view: viewController, output: output);
        return viewController
    }
    
    func historyViewController(output: AllPostOutput) -> UIViewController{
        let viewController = AllPostVC();
        viewController.presenter = HistoryPresenter(view: viewController, output: output)
        return viewController
    }
    
    func moreViewController(output: OptionOutput) -> UIViewController{
        let viewController = OptionVC();
        viewController.presenter = OptionPresenter(view: viewController, output: output);
        return viewController
    }
    
    func phoneNumberViewController(output: PhoneNumberOutput) -> UIViewController{
        let viewController = PhoneNumberVC();
        viewController.presenter = PhoneNumberPresenter(view: viewController,output: output);
        return viewController
    }
    
    func typeViewController(output: TypeOutput) -> UIViewController{
        let viewController = TypeVC();
        viewController.presenter = TypePresenter(view: viewController, output: output)
        return viewController;
    }
}

