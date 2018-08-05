
import Foundation

protocol OptionView:class {
    
    func showSignOutFail()
    func showHome();
}


protocol OptionPresenting:class {
    func viewOnReady()
    func logOut();
}

