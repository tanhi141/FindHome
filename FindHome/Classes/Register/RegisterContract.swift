
import Foundation
import UIKit

protocol RegisterOutput: class {
    func register(success: Any?);
}

protocol RegisterPresenting: class {
    func inputPhoneNumber(_ phoneNumber: String);
    func inputFullName(_ name: String);
    func inputPassword(_ password: String);
    func inputConfirmPassword(_ confirmPassword: String);
    func inputEmail(_ email: String);
    func tappedRegister();
    
    func viewOnReady()
}

protocol RegisterView: class {
    func showLoading(_ show: Bool);
    func showMessage(_ message: String,  callback: SimpleCallback?);
}
