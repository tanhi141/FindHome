

import Foundation
import UIKit
struct Alert{
    
    static func showInfo(message: String?,
                         on viewController: UIViewController,
                         callback: SimpleCallback?) {
        let alert = UIAlertController(title: Messages.NOTIFI_TITLE,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction.okAction(callback)
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil);
    }
    
    static func showOptionAddImage(title: String?,
                                   message: String?,
                                   on viewController: UIViewController,
                                   callback: OptionCallback?) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cameraAction = UIAlertAction.cameraAction(callback)
        let librabyAction = UIAlertAction.libraryAction(callback)
        let cancelAction = UIAlertAction.cancelImageAction(callback)
        
        alert.addAction(cameraAction)
        alert.addAction(librabyAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated:  true, completion: nil);
        
    }
}
