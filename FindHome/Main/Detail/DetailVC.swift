

import UIKit

class DetailVC: UIViewController {

    var presenter: DetailPresenter?
    
    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblMore: UILabel!
    
    @IBOutlet weak var btnCallOrPost: UIButton!
    @IBOutlet weak var btnMsgOrEdit: UIButton!
    
    @IBOutlet weak var btnNextImage: UIButton!
    @IBOutlet weak var btnBackImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        presenter?.viewOnReady()
    }

    func setUp(){
        self.scrollView.scrollsToTop = true
        scrollView.delegate = self
    }
}

extension DetailVC: UIScrollViewDelegate{
    
}
extension DetailVC: DetailView{
    func showTitle(_ title: String) {
        self.lblTitle.text = title
    }
    
    func showImage(_ list: [UIImage], idImage: Int){
        self.imageView.image = list[idImage]
    }
    
    func showAddress(_ address: String) {
        self.lblAddress.text = address
    }
    
    func showArea(_ area: String) {
        self.lblArea.text = area
    }
    
    func showPrice(_ price: String) {
        self.lblPrice.text = price
    }
    
    func showMore(_ more: String) {
        self.lblMore.text = more
    }
    
    func showError() {
        
    }
    
    func showHome(_ animate: Any?) {
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showPhoneNumber(_ phoneNumber: String) {
        self.lblPrice.text = phoneNumber
    }
    
    func showType(_ type: Type){
        self.lblType.text = "Loại: " + type.rawValue;
    }

    
    func updateUI(_ type: TypePost){
        switch type {
        case .read:
            btnCallOrPost.setTitle("Gọi điện", for: .normal)
            btnMsgOrEdit.setTitle("Nhắn tin", for: .normal)
            self.navigationItem.title = "Xem lại"
        case .write:
            btnCallOrPost.setTitle("Đăng tin", for: .normal)
            btnMsgOrEdit.setTitle("Chỉnh sửa", for: .normal)
            self.navigationItem.title = "Chi tiết"
        }
    }
    
}


extension DetailVC{
    
    @IBAction func tapButtonNextImage(_ sender: Any){
        presenter?.selectNextImage()
    }
    
    @IBAction func tapButtonBacktImage(_ sender: Any){
        presenter?.selectBackImage()
    }
    
    @IBAction func tapButtonCallOrPost(_ sender: Any){
        presenter?.tappedButtonCall()
    }
    
    @IBAction func tapButtonMsgOrEdit(_ sender: Any){
        presenter?.tappedButtonMessenger()
    }
}








