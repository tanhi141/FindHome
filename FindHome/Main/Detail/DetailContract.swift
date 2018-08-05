

import Foundation
import UIKit

protocol DetailPresenting: class {
    func viewOnReady();
    
    func selectNextImage();
    func selectBackImage();
    
    func tappedButtonCall()
    func tappedButtonMessenger()
    
}

protocol DetailView: class {
    
    func showTitle(_ title: String)
    func showImage(_ list: [UIImage], idImage: Int);
    func showAddress(_ address: String);
    func showArea(_ area: String);
    func showPrice(_ price: String);
    func showMore(_ more: String);
    func showPhoneNumber(_ phoneNumber: String);
    func showType(_ type: Type);
    
    func showError();
    func updateUI(_ type: TypePost);
//output
    func showHome(_ animate: Any?);
}
