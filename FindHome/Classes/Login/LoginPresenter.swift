

import Foundation


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
            view?.showError(message: Messages.Login.errorRequired)
            return false
        }
        
        return true
    }
    
    func login(){
        
        view?.showLoading(isShow: true);
        let account = UserAccount(email: self.email, password: self.password);
        FBAccountManager.shared.login(account: account) { [weak self](result) in
            
            guard let strongSelf = self else{
                return
            }
            if result == true{
                strongSelf.getData()
                strongSelf.view?.showLoading(isShow: false);
                strongSelf.output?.showHomeViewController();
                return;
                
            } else {
                strongSelf.view?.showError(message: Messages.Login.errorValidate);
                strongSelf.view?.showLoading(isShow: false);
                return;
            }
        }
    }
    
    func getData(){
    }
}
