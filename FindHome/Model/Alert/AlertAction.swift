
import Foundation
import  UIKit


typealias SimpleCallback = () -> Void
typealias SuccessCallback = (_ success: Bool) -> Void
typealias ErrorCallback = (_ error: Error) -> Void
typealias OptionCallback = (_ action: TypeAddImage) -> Void


extension UIAlertAction{
    static func okAction(_ callback: SimpleCallback?) -> UIAlertAction {
        return titledAction("OK", callback: callback)
    }
    static func cameraAction(_ callback: OptionCallback?) -> UIAlertAction {
        return titledAction("Mở máy ảnh", type: .Camera, callback: callback);
    }
    static func libraryAction(_ callback: OptionCallback?) -> UIAlertAction {
        return titledAction("Mở thư viện", type: .Library, callback: callback);
    }
    static func cancelImageAction(_ callback: OptionCallback?) -> UIAlertAction {
        return titledAction("Cancel",type: .Cancel, callback: callback);
    }
    
    static func cancelAction(_ callback: SimpleCallback?) -> UIAlertAction {
        return titledAction("Cancel", callback: callback);
    }
    
    //MARK: Utils
    private static func titledAction(_ title: String, callback: SimpleCallback?) -> UIAlertAction {
        return UIAlertAction(title: title, style: .default, handler: { (_) in
            callback?();
        })
    }
    
    private static func titledAction(_ title: String, type: TypeAddImage, callback: OptionCallback?) -> UIAlertAction {
        return UIAlertAction(title: title, style: .default, handler: { (action) in
            callback?(type)
        })

    }
    
}

extension UIAlertController{
    private static func addAction(_ title: String?, _ message: String?, callback: OptionCallback?) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let cameraAction = UIAlertAction.cameraAction(callback)
        let cancelAction = UIAlertAction.cancelImageAction(callback)
        let librabyAction = UIAlertAction.libraryAction(callback)
        
        alert.addAction(cameraAction)
        alert.addAction(librabyAction)
        alert.addAction(cancelAction)

        return alert
    }
}





