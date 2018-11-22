
import Foundation
import FirebaseAuth
import FirebaseDatabase

class RegisterPresenter: RegisterPresenting{
    let PHONENUMBER_REQUIRE = 10;
    
    private weak var view: RegisterView?;
    private weak var output: RegisterOutput?;
    
    var phoneNumber: String?
    var fullName: String?
    var password: String?
    var confirmPassword: String?
    var email: String?

    init(view: RegisterView, output: RegisterOutput) {
        self.view = view;
        self.output = output;
    }
    
    func viewOnReady() {
        view?.showLoading(false);
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
//        10. Xử lý chi tiết
//        (1) Hiển thị ban đầu
//        2. Xử lý check
        
        guard let _ = self.email,
        let _ = self.fullName,
        let phoneNumber = self.phoneNumber,
        let password = self.password,
        let confirmPassword = self.confirmPassword else {
            view?.showMessage(Messages.Register.ERROR_REQUIRED, callback: nil);
            return
        }
        
        guard phoneNumber.count == PHONENUMBER_REQUIRE else {
            view?.showMessage(Messages.Register.ERROR_WRONG_PHONE_NUMBER, callback: nil);
            return;
        }
        
        guard password == confirmPassword else {
            view?.showMessage(Messages.Register.ERROR_WRONG_PASSWORD, callback: nil);
            return;
        }
        
        var user = User();
        user.email = self.email ?? "";
        user.fullName = self.fullName;
        user.phonenNumber = self.phoneNumber;
        
        register(user: user, password: password);
    }
    
    func register(user: User, password: String){
        self.view?.showLoading(true)
        
        FBAccountManager.shared.register(user: user, password: password) { [weak self](error) in
            guard let strongSelf = self else {
                return;
            }
            
            strongSelf.view?.showLoading(false);
            
            if error == nil{
                strongSelf.view?.showMessage(Messages.Register.SUCCESS, callback: {
                    strongSelf.output?.register(success: nil);
                })
                
            } else {
                strongSelf.view?.showMessage(Messages.Register.ERROR_FAILED, callback: nil);
            }
        }
    }
    
}










