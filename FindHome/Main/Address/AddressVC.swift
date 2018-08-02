

import UIKit

class AddressVC: UIViewController {

    @IBOutlet var viewOption: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tfCity: UITextField!
     @IBOutlet weak var tfDistrict: UITextField!
     @IBOutlet weak var tfWard: UITextField!
     @IBOutlet weak var tfStreet: UITextField!
    
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
    func showAddress(cell: AddressCell, _ address: String) {
        
    }
    
    func showCity(_ city: String){
        self.tfCity.text = city
    }
    func showStreet(_ street: String){
        self.tfStreet.text = street
    }
    func showDistrict(_ district: String){
        self.tfDistrict.text = district;
    }
    func showWard(_ ward: String){
        self.tfWard.text = ward
    }
    
    func showAreaAndPrice(animated: Bool?){
        let viewController = AreaAndPriceVC()
        viewController.presenter = AreaAndPricePresenter(view: viewController)
        navigationController?.pushViewController(viewController, animated: animated!)
    }
}


//MARK: - Other
extension AddressVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
    
    
    @IBAction func tapButtonNext(_ sender: Any){
        presenter?.inputCity(tfCity.text ?? "")
        presenter?.inputDistrict(tfDistrict.text ?? "")
        presenter?.inputWard(tfWard.text ?? "")
        presenter?.inputStreet(tfStreet.text ?? "")
        
        presenter?.tappedButtonNext()
    }
}
