
import Foundation

protocol LoginOutput: class {
//    func loginOutput(_ showPhoneNumberViewController: Any?);
//    func showHomeViewController();
//    func showRegisterViewController();
//
    func showPhoneNumberViewController();
    func showHomeViewController();
    func showRegisterViewController();
}

protocol LoginView: class {
    func showError(message: String?)
    func showEmail(_ email: String)
    func showPassword(_ password: String)
    func showLoading(isShow: Bool);

}

protocol LoginPresenting: class {
    func viewOnReady();
    func tappedButtonLogin();
    func tappedButtonRegister();
    func inputEmail(email: String)
    func inputPassword(password: String)
    
}
