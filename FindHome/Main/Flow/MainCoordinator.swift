////  MainCoordinator.swift
////  FindHome
////
////  Created by TaNhi on 7/10/18.
////  Copyright © 2018 TaNhi. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class MainCoordinator{
//    private weak var output: MainCoordinatorOutput?;
//    private var factory: MainFactory;
//
//    var currentNavigationController: UINavigationController?;
//
//    init(output: MainCoordinatorOutput?) {
//        self.output = output;
//        self.factory = MainFactory()
//
//        currentNavigationController = UINavigationController()
//    }
//
//
//    func showPostViewController(output: AllPostOutput){
//        let viewController = factory.allPostViewController(output: output)
//        currentNavigationController?.pushViewController(viewController, animated: true);
//    }
//
//    func showViewController(output: ViewControllerOutput){
//        let viewController = factory.viewController(output: output)
//        currentNavigationController?.pushViewController(viewController, animated: true);
//    }
//
//}
//
//extension MainCoordinator: AllPostOutput{
//
//}
//
////extension MainCoordinator: PhoneNumberOutput{
////    func phoneNumberOut(_ animated: Any?) {
////        let viewController = factory.typeViewController(output: self)
////        currentNavigationController?.pushViewController(viewController, animated: true)
////    }
////
////
////}
//
//extension MainCoordinator: TypeOutput{
//
//}
//extension MainCoordinator: ViewControllerOutput{
//    func  welcome(_ animated: Any?) {
//        showPostViewController(output: self)
//    }
//
//}
