
import UIKit

class MoreVC: UIViewController {
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvMore: UITextView!
    @IBOutlet weak var viewMore: UIView!
    
    var presenter: MorePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = MorePresenter(view: self);
        navigationItem.title = "more"
        setUp()
        self.presenter?.viewOnReady();
        
    }

    func setUp(){
        self.viewMore.layer.borderColor = UIColor.gray.cgColor
        self.viewMore.layer.borderWidth = 1
    }

}

//MARK: - Action

extension MoreVC{
    @IBAction func tapButtonNext(_ sender: Any){
        presenter?.tappedButtonNext()
    }
}



//MARK: - MoreView
extension MoreVC: MoreView{
    func showTitle(_ title: String) {
        self.tfTitle.text = title
    }
    
    func showMore(_ more: String) {
        self.tvMore.text = more
    }
    
    func showWarning() {
        
    }
    
    func showImageiewController(animated: Bool?) {
        let viewController = ImageVC()
        navigationController?.pushViewController(viewController, animated: animated!)
    }
    
}
