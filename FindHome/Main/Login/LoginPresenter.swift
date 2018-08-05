

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
        self.password = userAccount?.password ?? ""
    }
    
    func viewOnReady() {
        
        view?.showEmail(self.email ?? "")
        view?.showPassword(self.password ?? "")
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
            
            let ref = Database.database().reference().child("User").queryOrdered(byChild: "email").queryEqual(toValue: self.email ?? "")
            
            ref.observeSingleEvent(of: .value, with: {[weak self] snapshot in

                if !snapshot.exists() {
                    return
                }

                let user = snapshot.value as! [String: Any]
                let infoUser = user.values.first as? [String: String]

                User.share.email = infoUser?["email"]  ?? ""
                User.share.fullName = infoUser?["fullName"] ?? ""
                User.share.phonenNumber = infoUser?["phoneNumber"] ?? ""
                User.share.idUser = infoUser?["idUser"] ?? ""

            })
        }
        
        Auth.auth().signIn(withEmail: (self.email)!, password: (self.password)!) {[weak self] (user, error) in
            
            if error == nil {
                
                
                defaults.set(self?.email, forKey: "email")
                defaults.set(self?.password, forKey: "password")
                defaults.synchronize()
                
                print("Successfully")
                print("user login: \(String(describing: user?.description))")
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
