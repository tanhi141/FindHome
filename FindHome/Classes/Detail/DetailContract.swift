

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
    
  
    func showIndication(_ show: Bool);
    func showError(_ message: String);
    func updateUI(_ type: TypePost);
    func showHome(_ animate: Any?);
}
