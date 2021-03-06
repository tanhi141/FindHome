
import Foundation


protocol ReviewView:class {
    func showTitle(_ title: String)
    func showMore(_ more: String)
    
    func showError(_ message: String);
    
    //output
    func showImageViewController(animated: Bool?);
    
}


protocol ReviewPresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();
    func inputTitle(_ title: String)
    func inputMore(_ more: String)
    
}

