//
//import Foundation
//import  UIKit
//
//class MainFactory{
//
//    func allPostViewController(output: AllPostOutput ) -> UIViewController {
//        let viewController = AllPostVC();
//        viewController.presenter = AllPostPresenter(view: viewController, output: output);
//        return viewController;
//    }
//    
//    func viewController(output: ViewControllerOutput) -> UIViewController{
//        let viewController = ViewController()
//        viewController.presenter = ViewControllerPresenter(view: viewController, output: output);
//        return viewController
//    }
//    
//    func typeViewController(output: TypeOutput) -> UIViewController{
//        let viewController = TypeVC()
//        viewController.presenter = TypePresenter(view: viewController, output: output);
//        return viewController
//
//    }
//    
//
//}
