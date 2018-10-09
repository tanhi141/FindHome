//
//  MainCoordinator.swift
//  FindHome
//
//  Created by TaNhi on 10/2/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator{
    
    private let factory: MainFactory;
    private weak var output: MainCoordinatorOutput?;
    
    var navigationController: UINavigationController?
    
    init(output: MainCoordinatorOutput) {
        self.factory = MainFactory();
        self.output = output;
        self.navigationController = factory.navigationoController();
    }
    
    func start() -> UIViewController{
        return factory.allPostViewController(output: self)
//        showAllPostViewController();
    }
}

extension MainCoordinator{
    func showAllPostViewController(){
        let viewController = factory.allPostViewController(output: self);
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: AllPostOutput{
    
}
