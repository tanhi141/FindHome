

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
        
        setUp();
        presenter?.viewOnReady()
    }

    func setUp(){
        self.navigationItem.title = "Đăng kí";
        btnRegister.setNextStyle()
        
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        if textField === tfFullName{
//            textField.text = ((textField.text! ?? "") + string).uppercased()
//            textField.text?.removeLast()
//        }
//
        return true;
    }
}


//MARK: -  Action
extension RegisterVC{
    @IBAction func tapButtonRegister(_ sender: Any){
        self.view?.endEditing(true)
        guard !(tfPhoneNumber.text?.isEmpty)!,
            !(tfFullName.text?.isEmpty)!,
            !(tfPassword.text?.isEmpty)!,
            !(tfConfirmPassword.text?.isEmpty)!,
            !(tfEmail.text?.isEmpty)! else {
            showErrorInvalid()
            return
        }
        presenter?.tappedRegister()
    }
}



//MARK: -  RegisterView
extension RegisterVC: RegisterView{
    func showErrorInvalid() {
        Alert.showInfo(message: "Vui lòng kiểm tra lại thông tin", on: self, callback: nil)
    }
    
    func showSuccess(){
            Alert.showInfo(message: "Đăng kí thành công.", on: self, callback: {
                self.showHome()
            })
    }
    
    func showErrorConfirmPassword() {
        Alert.showInfo(message: "Mật khẩu chưa trùng nhau. Vui lòng kiểm tra lại.", on: self, callback: nil)
    }
    
    func showErrorForrmatEmail() {
        Alert.showInfo(message: "Vui lòng kiểm tra lại email và thử lại trong lần sau.", on: self, callback: nil)
    }
    
    func showDetail() {
//        let detailVC = HomeVC();
//        navigationController?.pushViewController(detailVC, animated: true)
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
    
    func showHome(){
//        let loginVC = HomeVC();
//        navigationController?.pushViewController(loginVC, animated: true)
        
    }
    func showLogin(){
//        let loginVC = Login();
//        loginVC.presenter = LoginPresenter(view: loginVC, userAccount: nil)
//        navigationController?.pushViewController(loginVC, animated: true)
        
    }
}
//MARK: - Other
extension RegisterVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
}









