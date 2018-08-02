

import UIKit

class ReviewVC: UIViewController {

    @IBOutlet weak var viewText: UIView!
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tvMore: UITextView!
    
    var presenter: ReviewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        presenter?.viewOnReady()
    }
    
    func setUp(){
        self.navigationItem.title = "Mô tả"
        btnNext.setNextStyle()
        viewText.layer.borderColor = UIColor.gray.cgColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
        
    }
}


extension ReviewVC: UITextViewDelegate, UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === tfTitle{
            tvMore.becomeFirstResponder()
        }
        
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField === tfTitle{
            presenter?.inputTitle(textField.text ?? "")
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView === tvMore{
            presenter?.inputMore(textView.text ?? "")
        }
        
    }
    
}
extension ReviewVC: ReviewView{
    func showTitle(_ title: String) {
        self.tfTitle.text = title
    }
    
    func showWarning() {
        
    }
    
    func showMore(_ more: String) {
        self.tvMore.text = more
    }
    
    //ouput
    func showImageViewController(animated: Bool?) {
        let viewController = ImageVC()
        viewController.presenter = ImagePresenter(view: viewController)
        self.navigationController?.pushViewController(viewController, animated: animated!)
    }
    
}


//MARK:- Action
extension ReviewVC{
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
    
    @IBAction func tapButtonNext(_ sender: Any){
        self.view.endEditing(true);
        presenter?.inputTitle(self.tfTitle.text ?? "")
        presenter?.inputMore(self.tvMore.text ?? "")
        presenter?.tappedButtonNext()
    }
    
    
}
