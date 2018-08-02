
import Foundation
import FirebaseAuth
import FirebaseDatabase

class RegisterPresenter: RegisterPresenting{
    
    private weak var view: RegisterView?
    var phoneNumber: String
    var fullName: String
    var password: String
    var confirmPassword: String
    var email: String?

    init(view: RegisterView) {
        self.view = view;
        self.phoneNumber = ""
        self.fullName = ""
        self.password = ""
        self.confirmPassword = ""
        self.email = ""
    }
    
    func viewOnReady() {
        view?.showIndicatorView(false)
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
            view?.showErrorConfirmPassword();
            return;
        }
        view?.showIndicatorView(true)
        
        
        Auth.auth().createUser(withEmail: self.email!, password: self.password) { (user, error) in
            
            if error == nil {
                print("You have successfully signed up")
                
                var ref: DatabaseReference?
                ref = Database.database().reference()
                
//                let idUser = ref?.child("User").childByAutoId()
                let idUser = ref?.child("User").childByAutoId()
                idUser?.setValue(["idUser": idUser?.key,
                                  "email" : self.email,
                                  "fullName": self.fullName,
                                  "phoneNumber": self.phoneNumber]);
                
                self.view?.showIndicatorView(false)
                self.view?.showSuccess();
                
            } else {
                self.view?.showErrorForrmatEmail()
                self.view?.showIndicatorView(false)

            }
        }
        
        
    }
}










