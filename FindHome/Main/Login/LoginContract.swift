
import Foundation

protocol LoginView: class {
    func showError();
    func showCanNotLogin()
    func showIndicatorView(_ show: Bool)
    
    func showEmail(_ email: String)
    func showPassword(_ password: String)
    //output
    func showPhoneNumberViewController();
    func showHome()
}

protocol LoginPresenting: class {
    func viewOnReady();
    func tappedButtonLogin();
    
    func inputEmail(email: String)
    func inputPassword(password: String)
    
}
