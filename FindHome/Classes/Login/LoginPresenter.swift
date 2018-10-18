

import Foundation
import Alamofire
import FirebaseAuth

class LoginPresenter: LoginPresenting{
    
    private weak var view: LoginView?;
    private weak var output: LoginOutput?;
    var email: String?
    var password: String?
    
    init(view: LoginView, output: LoginOutput, userAccount: UserAccount?) {
        self.view = view
        self.output = output;
        self.email = userAccount?.email;
        self.password = userAccount?.password;
    }
    
    func viewOnReady() {
        view?.showLoading(isShow: false);
        view?.showEmail(self.email ?? "")
        view?.showPassword(self.password ?? "")
        
    }
    
    func tappedButtonLogin(){
        guard checkRequied() else {
            return;
        }
        
        login()
    }
    
    
    func inputEmail(email: String) {
        self.email = email
    }
    
    func inputPassword(password: String) {
        self.password = password;
    }
    
    func tappedButtonRegister() {
        output?.showRegisterViewController()
    }
}

//MARK: - Other
extension LoginPresenter{
    
    func checkRequied() -> Bool{
        
        guard self.email?.isEmpty == false,
            self.password?.isEmpty == false else {
            view?.showError(message: Messages.Login.ERROR_REQUIRED) //2.a.1
            return false
        }
        
        return true
    }
    
    func login(){
        
        guard  NetworkReachabilityManager()?.isReachable == true else {  //2.a.5
            view?.showError(message: Messages.Login.ERROR_CONNECT);
            return;
        }
        
        view?.showLoading(isShow: true);

        let account = UserAccount(email: self.email, password: self.password);
        
        FBAccountManager.shared.login(account: account) { [weak self](error) in
            
            guard let strongSelf = self else{
                return
            }
            
            if error == nil{
                strongSelf.getData()
                strongSelf.view?.showLoading(isShow: false);
                strongSelf.output?.showHomeViewController();
                return;
                
            } else {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    
                    switch errCode {
                        
                    case .wrongPassword: //2.a.4
                        strongSelf.view?.showError(message: Messages.Login.ERROR_WRONG_PASSWORD);
                        
                    case .invalidEmail: //2.a.2
                        strongSelf.view?.showError(message: Messages.Login.ERROR_INVALID_EMAIL);
                        
                    case .userNotFound: //2.a.3
                        strongSelf.view?.showError(message: Messages.Login.ERROR_USER_NOT_FOUND);
                    
                    default:
                        break;
                        
                    }
                    
                }
                
                strongSelf.view?.showLoading(isShow: false);
            }
        }
    }
    
    func getData(){
        
    }
}
