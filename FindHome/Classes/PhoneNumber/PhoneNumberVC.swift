
import UIKit

class PhoneNumberVC: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    var presenter: PhoneNumberPresenter?;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        tfPhoneNumber.resignFirstResponder();
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setUp();
        presenter?.viewOnReady();
    }
    
    func setUp(){
        setTitleNavigation(title:  Title.PHONENUMBER_TITLE);
        btnNext.setNextStyle()
        tfPhoneNumber.resignFirstResponder()
    }

}
//MARK: - Other
extension PhoneNumberVC{
}


//MARK: - Action
extension PhoneNumberVC{
    @IBAction func tapButtonNext(_ sender: Any){
        self.view?.endEditing(true)
        presenter?.inputPhoneNumber(tfPhoneNumber.text ?? "")
        presenter?.tappedButtonNext()
    }
    
}

extension PhoneNumberVC: PhoneNumberView{    
    func showPhoneNumber(phoneNumber: String) {
        self.tfPhoneNumber.text = phoneNumber;
    }
    
    func showError(){
        Alert.showInfo(message: Messages.PhoneNumber.ERROR_VALIDATE,
                       on: self, callback: nil);
    }
    
}

