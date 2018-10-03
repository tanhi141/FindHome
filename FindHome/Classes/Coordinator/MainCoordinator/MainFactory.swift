//
//  MainFactory.swift
//  FindHome
//
//  Created by TaNhi on 10/2/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
import  UIKit

class MainFactory {
    
    func navigationoController() -> UINavigationController{
        let navigationController = UINavigationController()
        return navigationController;
    }
    
    func allPostViewController(output: AllPostOutput) -> UIViewController{
        let viewController = AllPostVC();
        viewController.presenter = AllPostPresenter(view: viewController, output: output);
        return viewController;
    }
    
//    func historyViewController(output: AllPostOutput) -> UIViewController{
//        let viewController = AllPostVC();
//        viewController.presenter = AllPostPresenter(view: viewController, output: output);
//        return viewController;
//    }
//
//    func allPostViewController(output: AllPostOutput) -> UIViewController{
//        let viewController = AllPostVC();
//        viewController.presenter = AllPostPresenter(view: viewController, output: output);
//        return viewController;
//    }
//
//    func allPostViewController(output: AllPostOutput) -> UIViewController{
//        let viewController = AllPostVC();
//        viewController.presenter = AllPostPresenter(view: viewController, output: output);
//        return viewController;
//    }
}
