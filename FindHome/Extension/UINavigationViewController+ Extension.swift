import UIKit
import Foundation


extension UINavigationController{

    
    
    func setNavigationTitle(title: String){
        
    }
    
    func hideNagigationBar(_ isHiden: Bool){
//        if isHiden{
//            self.isToolbarHidden = true
//        }
    }
    
    @objc private func back(_ sender: Any){
        self.popViewController(animated: true)
    }

    
}
