

import UIKit

class AddressVC: UIViewController {

    @IBOutlet var viewOption: UIView!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var tfAddress: UITextField!
    var presenter: AddressPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter?.viewOnReady()
    }
    
    func setUp(){
        navigationItem.title = "Địa chỉ";
        btnNext.setNextStyle()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }

}



extension AddressVC: AddressView{
    func showAddress(_ address: String) {
        tfAddress.text = address;
    }
    
    func showError(_ message: String) {
        Alert.showInfo(message: message, on: self, callback: nil);
    }
    
    func showAddress(cell: AddressCell, _ address: String) {
        
    }
    
    func showAreaAndPrice(animated: Bool?){
        let viewController = AreaAndPriceVC()
        viewController.presenter = AreaAndPricePresenter(view: viewController)
        navigationController?.pushViewController(viewController, animated: animated!)
    }
    
    func showError(){
        Alert.showInfo(message: Messages.Address.ERROR_REQUIRED, on: self, callback: nil);
    }
}


//MARK: - Other
extension AddressVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
    
    
    @IBAction func tapButtonNext(_ sender: Any){
        presenter?.inputAddress(tfAddress.text ?? "");
        presenter?.tappedButtonNext()
    }
}
