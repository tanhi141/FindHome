
import UIKit

class PhoneNumberVC: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    var presenter: PhoneNumberPresenter?;
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter = PhoneNumberPresenter(view: self)
        presenter?.viewOnReady()
    }
    
    func setUp(){
        navigationItem.title = "Liên hệ";
        btnNext.setNextStyle()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }

}
//MARK: - Other
extension PhoneNumberVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
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
    func phoneNumberOutput(currentPost: DetailPost?) {
        
    }
    
    func showPhoneNumber(phoneNumber: String) {
        self.tfPhoneNumber.text = phoneNumber;
    }
    
    func showError(){
        Alert.showInfo(title: Messages.PhoneNumber.errorTitle,
                       message: Messages.PhoneNumber.errorMessage,
                       on: self, callback: nil)
    }
    
    func phoneNumberOutput(_ animated: Any?){
        let viewController = TypeVC()
        viewController.presenter = TypePresenter(view: viewController);
        navigationController?.pushViewController(viewController, animated: (animated != nil))
    }
}

