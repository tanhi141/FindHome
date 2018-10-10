
import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var btnRegister: UIButton?
    
    var presenter : LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewOnReady()
        setUp();
        
    }

    func setUp(){
        setTitleNavigation(title: Title.loginTitle);
        btnLogin.setNextStyle()
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }
    
}

extension LoginVC: LoginView{
    
    func showEmail(_ email: String){
        tfEmail.text = email
    }
    
    func showPassword(_ password: String){
        tfPassword.text = password
    }
    
    func showLoading(isShow: Bool) {
        if isShow{
            self.indicatorView.show();
        } else{
            self.indicatorView.hide();
        }
    }
    
    func showError(message: String?){
        Alert.showInfo(message: message,
                       on: self,
                       callback: nil);
    }
    
}

//MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        if textField === tfEmail{
            presenter?.inputEmail(email: self.tfEmail.text ?? "")
            
        } else if textField === tfPassword{
            presenter?.inputPassword(password: tfPassword.text ?? "")
            self.view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField === tfEmail{
            tfPassword.becomeFirstResponder()
            
        } else {
            tfPassword.resignFirstResponder()
        }
        
        return true;
    }
    
}


//MARK: - Action
extension LoginVC{
    @IBAction func tapButtonLogin(_ sender: Any){
        self.view.endEditing(true)
        presenter?.inputEmail(email: tfEmail.text ?? "")
        presenter?.inputPassword(password: tfPassword.text ?? "")
        presenter?.tappedButtonLogin()
    }
    
    @IBAction func tapButtonRegister(_ sender: Any){
        
        let viewController = RegisterVC()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


//MARK: - Other
extension LoginVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
}
