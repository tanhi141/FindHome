
import Foundation
import FirebaseAuth
import FirebaseDatabase

class RegisterPresenter: RegisterPresenting{
    
    private weak var view: RegisterView?
    private weak var output: RegisterOutput?
    
    var phoneNumber: String
    var fullName: String
    var password: String
    var confirmPassword: String
    var email: String?

    init(view: RegisterView, output: RegisterOutput) {
        self.view = view;
        self.phoneNumber = ""
        self.fullName = ""
        self.password = ""
        self.confirmPassword = ""
        self.email = ""
    }
    
    func viewOnReady() {
        view?.showLoading(false)
    }
    func inputPhoneNumber(_ phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func inputFullName(_ name: String) {
        self.fullName = name
    }
    
    func inputPassword(_ password: String) {
        self.password = password
    }
    
    func inputConfirmPassword(_ confirmPassword: String) {
        self.confirmPassword = confirmPassword
    }
    
    func inputEmail(_ email: String){
        self.email = email
    }
    
    func tappedRegister(){
        guard password == confirmPassword else {
                //not confirm
            return;
        }
        self.view?.showLoading(true)
        
        
        //login
    }
}










