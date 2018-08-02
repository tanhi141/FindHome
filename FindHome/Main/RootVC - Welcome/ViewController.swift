
import Foundation
import UIKit

class ViewController: UIViewController {

    var presenter : ViewControllerPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOnReady()
        navigationItem.title = "abc"
    }

}


extension ViewController{
    func viewOnReady() {
//        print("chuyen man hinh")
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
//            print("delay")
//            guard let strongSelf = self else{
//                return
//            }
//
//        }
    }
}

extension ViewController: ViewControllerView{
    
}







