

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
//    (2) Xử lý đăng nhập
//    2. Xử lý check
//    a. Check hạng mục
    func checkRequied() -> Bool{
    
        //2. Xử lý check 2.a.1
        guard self.email?.isEmpty == false,
            self.password?.isEmpty == false else {
            view?.showError(message: Messages.Login.ERROR_REQUIRED)
            return false
        }
        
        return true
    }
    
    func login(){
        
        //2. Xử lý check 2.a.5
        guard  NetworkReachabilityManager()?.isReachable == true else {
            view?.showError(message: Messages.ERROR_CONNECT);
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
                Check.shared.isLogin = true;

                strongSelf.output?.showHomeViewController();
                return;
                
            } else {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    
                    switch errCode {
                    
                    //2. Xử lý check 2.a.4
                    case .wrongPassword:
                        strongSelf.view?.showError(message: Messages.Login.ERROR_WRONG_PASSWORD);
                    
                    //2. Xử lý check 2.a.2
                    case .invalidEmail:
                        strongSelf.view?.showError(message: Messages.Login.ERROR_INVALID_EMAIL);
                    
                    //2. Xử lý check 2.a.3
                    case .userNotFound:
                        strongSelf.view?.showError(message: Messages.Login.ERROR_USER_NOT_FOUND);
                    
                    default:
                        break;
                        
                    }
                    
                }
                
                strongSelf.view?.showLoading(isShow: false);
            }
        }
    }
    
    //(1) Lấy thông tin user
    func getData(){
        
    }
}
