

import UIKit

class AreaAndPriceVC: UIViewController {
    
    @IBOutlet weak var tfArea: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tfPrice: UITextField!
    
    var presenter: AreaAndPricePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        presenter?.viewOnReady()
        
    }
    
    func setUp(){
        navigationItem.title = "Tổng quan"
        btnNext.setNextStyle();
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }

}

extension AreaAndPriceVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === tfArea{
            tfPrice.becomeFirstResponder()
        } else if textField === tfPrice{
            tfPrice.resignFirstResponder()
        }
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField === tfArea{
            presenter?.inputArea(tfArea.text ?? "")
        } else if textField === tfPrice{
//            presenter?.inputPrice(tfPrice?.text ?? "")
        }
    }
    
}

extension AreaAndPriceVC: AreaAndPriceView{
    func updateTableView(currentType: Type?) {
        
    }
    
    func showArea(_ area: String) {
        tfArea.text = area
    }
    
    func showPrice(_ price: Int) {
        tfPrice.text = price.description
    }
    
    func showWarning(){
        //them label hien thi warning
    }
    
    //output
    func showReviewViewController(animated: Bool?){
        let viewController = ReviewVC()
        viewController.presenter = ReviewPresenter(view: viewController)
        navigationController?.pushViewController(viewController, animated: animated ?? true)
    }

}


//MARK: - Action
extension AreaAndPriceVC{
    @IBAction func tapButtonNext(_ sender: Any){
        self.view?.endEditing(true)
        presenter?.tappedButtonNext()
    }
    
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
}
