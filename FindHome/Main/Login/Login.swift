
import UIKit

class Login: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    @IBOutlet weak var btnRegister: UIButton?
    var presenter : LoginPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LoginPresenter(view: self, userAccount: nil)
        presenter?.viewOnReady()
        setUp()
        
    }

    func setUp(){
        navigationItem.title = "Login"
        btnLogin.setNextStyle()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }
}

extension Login: LoginView{
    func showError(){
        Alert.showInfo(title: "Thông báo", message: "Vui lòng điền đầy đủ thông tin.", on: self, callback: nil)
    }
    
    func showCanNotLogin(){
        Alert.showInfo(title: "Thông báo", message: "Email hoặc password không đúng. Vui lòng kiểm tra lại.", on: self, callback: nil)
    }
    
    func showIndicatorView(_ show: Bool){
        if show == false{
            self.indicatorView.stopAnimating()
            self.indicatorView.isHidden = true;
        } else {
            self.indicatorView.isHidden = false;
            self.indicatorView.startAnimating()
        }
    }

    
    func showPhoneNumberViewController(){
        let viewController = PhoneNumberVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showHome(){
        let viewController = HomeVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension Login: UITextFieldDelegate{
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
        return true
    }
    
}


//MARK: - Action
extension Login{
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
extension Login{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
}
