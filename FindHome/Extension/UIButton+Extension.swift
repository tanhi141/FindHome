//
import UIKit

extension UIButton {
    
    var titleColor: UIColor? {
        get {
            return titleColor(for: .normal);
        }
        set {
            setTitleColor(newValue, for: .normal);
        }
    }
    
    func setShadow(shadowOpacity: CGFloat,shadowOffset: CGSize,shadowRadius: CGFloat,shadowColor: UIColor){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
    }
    
    func setBorder(color: UIColor?, lineWidth: CGFloat) {
        self.layer.borderColor = color?.cgColor;
        self.layer.borderWidth = lineWidth;
    }
    
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1));
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor);
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1));
        let colorImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.setBackgroundImage(colorImage, for: forState);
    }
    
    func enable(isEnable: Bool){
        if isEnable{
            setNextStyle()
            isEnabled = true;
        } else {
            
            setNextStyle()
            titleColor = Colors.grayColor;
            setBorder(color: Colors.grayColor , lineWidth: 3);
            isEnabled = false;
        }
    }
    
    func setNextStyle() {
        titleColor = Colors.masterColor;
        titleLabel?.font = UIFont(name: "Trebuchet MN", size: 24);
        backgroundColor = UIColor.clear
        setBorder(color: Colors.masterColor , lineWidth: 3);
        layer.cornerRadius = 18;
        
    }
    
    func setLoginStyle() {
        titleColor = .white
        titleLabel?.font = UIFont(name: "Trebuchet MN", size: 24);
        backgroundColor = UIColor.clear
        setBorder(color: .white , lineWidth: 3);
        layer.cornerRadius = 18;
    }
}
