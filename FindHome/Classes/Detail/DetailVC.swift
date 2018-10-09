

import UIKit

class DetailVC: UIViewController {

    var presenter: DetailPresenter?
    
    @IBOutlet weak var indi: UIActivityIndicatorView!
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
        indi.hidesWhenStopped = true
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
    
    func showAddress(_ address: Address) {
        var str: String?
        if address.street != nil{
            str = address.street
        }
        if address.ward != nil {
            str = str ?? "" + address.ward!
        }
        if address.district != nil {
            str = str ?? "" + address.district!
        }
        if address.city != nil {
            str = str ?? "" + address.district!
        }
        self.lblAddress.text = "Địa chỉ: \(str ?? "")";
    }
    
    func showArea(_ area: String) {
        self.lblArea.text = "Diện tích: \(area) m2"
    }
    
    func showPrice(_ price: String) {
        self.lblPrice.text = "Giá cho thuê: \(price) / 1 tháng";
    }
    
    func showMore(_ more: String) {
        self.lblMore.text = "Mô tả: \n" + more;
    }
    
    func showError(success: Bool){
        if success {
            Alert.showInfo(message: nil, on: self, callback: nil)
        } else {
            Alert.showInfo(message: "Quá trình đăng thất bại. Vui lòng thử lại lần sau.", on: self, callback: nil)
        }
        
    }
    
    func showPhoneNumberVC(_ phoneNumber: String){
        let vc = PhoneNumberVC()
        vc.presenter = PhoneNumberPresenter(view: vc, phoneNumber: phoneNumber);
        navigationController?.pushViewController(vc, animated: true);
    }
    
    func showHome(_ animate: Any?) {
//        let vc = HomeVC()
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    func showPhoneNumber(_ phoneNumber: String) {
        self.lblPhoneNumber.text = "Điện thoại: \(phoneNumber)"
    }
    
    func showType(_ type: Type){
        self.lblType.text = "Loại: " + type.rawValue;
    }

    func showIndication(_ show: Bool){
        if show{
            indi.startAnimating()
            indi.isHidden = false
        } else {
            indi.stopAnimating()
            indi.isHidden = true
        }
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
        case .unknow:
            break;
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








