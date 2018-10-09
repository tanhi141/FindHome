
import Foundation

protocol LoginOutput: class {
    func showPhoneNumberViewController();
    func showHome();
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
    func inputEmail(email: String)
    func inputPassword(password: String)
    
}
