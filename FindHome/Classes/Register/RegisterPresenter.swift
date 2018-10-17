
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
//        view?.showLoading(false)
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
        self.view?.showLoading(true)
        
        
        Auth.auth().createUser(withEmail: self.email!, password: self.password) { (user, error) in
            
            if error == nil {
                
                
                var ref: DatabaseReference?
                ref = Database.database().reference()
                    
                let idUser = ref?.child("User").childByAutoId()
                idUser?.setValue(["idUser": idUser?.key ?? "",
                                  "email" : self.email,
                                  "fullName": self.fullName,
                                  "phoneNumber": self.phoneNumber]);
                
                self.view?.showLoading(false)
                self.view?.showSuccess();
                User.shared.idUser = idUser?.key ?? "";
                User.shared.email = self.email;
                User.shared.fullName = self.fullName;
                User.shared.phonenNumber = self.phoneNumber;
            } else {
                self.view?.showErrorForrmatEmail()
                self.view?.showLoading(false)

            }
        }
        
        
    }
}










