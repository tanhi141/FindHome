

import UIKit

class RegisterVC: UIViewController {
    var presenter: RegisterPresenter?
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI();
        presenter?.viewOnReady()
    }

    func initUI(){
        self.navigationItem.title = Title.SIGNUP_TITLE;
        btnRegister.setNextStyle();
        self.indicatorView.isHidden = true;
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }

}


extension RegisterVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField === tfEmail{
            presenter?.inputEmail(tfEmail.text ?? "")
        } else if textField === tfPhoneNumber{
            presenter?.inputPhoneNumber(tfPhoneNumber.text ?? "")
        } else if textField === tfFullName{
            presenter?.inputFullName(tfFullName.text ?? "")
        } else if textField === tfPassword{
            presenter?.inputPassword(tfPassword.text ?? "")
        } else if textField === tfConfirmPassword{
            presenter?.inputConfirmPassword(tfConfirmPassword.text
                ?? "")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField === tfEmail{
            tfEmail.becomeFirstResponder()
        } else if textField === tfPhoneNumber{
            tfFullName.becomeFirstResponder()
        } else if textField === tfFullName{
            tfPassword.becomeFirstResponder()
        } else if textField === tfPassword{
            tfConfirmPassword.becomeFirstResponder()
        } else if textField === tfConfirmPassword{
            tfConfirmPassword.resignFirstResponder()
        }
        
        return true
    }
}


//MARK: -  Action
extension RegisterVC{
    @IBAction func tapButtonRegister(_ sender: Any){
        self.view?.endEditing(true);
        presenter?.tappedRegister()
    }
}



//MARK: -  RegisterView
extension RegisterVC: RegisterView{

    func showMessage(_ message: String, callback: SimpleCallback?) {
        Alert.showInfo(message: message, on: self, callback: callback);
    }
    
    func showLoading(_ show: Bool){
        if show{
            self.indicatorView.show();
        } else{
            self.indicatorView.hide();
        }
    }
}
//MARK: - Other
extension RegisterVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
}









