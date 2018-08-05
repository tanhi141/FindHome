import UIKit
import Foundation


extension UINavigationController{

    
    
    func setNavigationTitle(title: String, isHide: Bool){
    
//        let image = UIImageView()
//        image.image = #imageLiteral(resourceName: "navigation")
//        image.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
//
//
//        let label = UILabel()
//        label.frame = CGRect(x: 0, y: 37, width: self.view.frame.width, height: 20)
//        label.textAlignment = NSTextAlignment.center;
//        label.text = title
//        label.textColor = .white
//        label.isHighlighted = true
//        label.font = UIFont(name: "Trebuchet MS", size: 20)!;
//
//        var buttonLeft = UIButton()
//        buttonLeft.titleColor = .white
//        buttonLeft.titleLabel?.text = "Back";
//        buttonLeft.titleLabel?.font = UIFont(name: "Trebuchet MS", size: 18)!;
//        buttonLeft.addTarget(self, action: #selector(back(_:))  , for: .touchUpInside);
//
//        buttonLeft.frame = CGRect(x: 0, y: 37, width: 60, height: 20)
//
//        if isHide == true {
//            image.isHidden = true
//            label.isHidden = true
//            buttonLeft.isHidden = true
//        }
//
//
//        image.addSubview(buttonLeft)
//        image.addSubview(label)
//        self.view.addSubview(image)
        
        
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
