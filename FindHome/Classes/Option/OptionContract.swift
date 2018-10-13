
import Foundation

protocol OptionOutput: class{
    
}
protocol OptionView:class {
    
    func showSignOutFail()
    func showHome();
}


protocol OptionPresenting:class {
    func viewOnReady()
    func signOut();
}

