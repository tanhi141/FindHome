

import Foundation
import FirebaseAuth
import Firebase
class LoginPresenter: LoginPresenting{

    private weak var view: LoginView?;
    var email: String?
    var password: String?
    
    init(view: LoginView, userAccount: UserAccount?) {
        self.view = view
        
        self.email = userAccount?.email ?? ""
        self.password = ""
    }
    
    func viewOnReady() {
        view?.showIndicatorView(false)
    }
    
    func tappedButtonLogin(){
        checkIsValid()
    }
    
    
    func inputEmail(email: String) {
        self.email = email
    }
    
    func inputPassword(password: String) {
        self.password = password;
    }
}

//MARK: - Other
extension LoginPresenter{
    
    func checkIsValid() {
        
        guard self.email?.isEmpty == false && self.password?.isEmpty == false else {
            view?.showError()
            return
        }
        
        view?.showIndicatorView(true)
        
//        PhoneAuthProvider.provider().verifyPhoneNumber(email!, uiDelegate: nil) { (verificationID, error) in
//            if let error = error {
//                print("loi sdt");
////                self.showMessagePrompt(error.localizedDescription)
//                return
//            } else{
//                print("thanh cong");
//            }
//
//        }
        
        func getData(){
            
//            let ref = Database.database().reference(withPath: "User\(self.email!)")
            
            let ref = Database.database().reference().child("User").queryOrdered(byChild: "email").queryEqual(toValue: self.email!)
            
            ref.observeSingleEvent(of: .value, with: { snapshot in

                if !snapshot.exists() { print("loi\n");print(snapshot.key); return }
                print(snapshot.key)
                let user = snapshot.value;
                print(user ?? "")
                
                
//                []
//                User.share.email =
                print(User.share.email)
                
                
                
            })
        }
        
        Auth.auth().signIn(withEmail: (self.email)!, password: (self.password)!) {[weak self] (user, error) in
            
            if error == nil {
                let defaults = UserDefaults.standard
                
                defaults.set(self?.email, forKey: "username")
                defaults.set(self?.password, forKey: "password")
                
                print("Successfully")
                
                Check.checkAll.isLogin = true
                self?.view?.showIndicatorView(false)
                getData()
                self?.view?.showHome()
                
            } else {
                self?.view?.showCanNotLogin()
                self?.view?.showIndicatorView(false)
            }
        }
    }
}
