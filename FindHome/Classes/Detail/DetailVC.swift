

import UIKit

class DetailVC: UIViewController {
    let IDENTIFIRE_CELL_IMAGE = "ImageDetailCell";
    let IDENTIFIRE_CELL_DETAIL = "DetailCellxib";
    
    let ivIconArea = UIImage(named: "ic_area") ?? UIImage();
    let ivIconPrice = UIImage(named: "icon_price") ?? UIImage();
    let ivIconType = UIImage(named: "ic_homes") ?? UIImage();
    let ivIconMore = UIImage(named: "ic_edit") ?? UIImage();
    let ivIconAddress = UIImage(named: "ic_address") ?? UIImage()
    
    
    var presenter: DetailPresenter?
    
    @IBOutlet weak var tbvDetail: UITableView!
    @IBOutlet weak var btnCallOrPost: UIButton!
    @IBOutlet weak var btnMsgOrEdit: UIButton!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvDetail.register(UINib(nibName: IDENTIFIRE_CELL_IMAGE, bundle: nil),
                           forCellReuseIdentifier: IDENTIFIRE_CELL_IMAGE);
        tbvDetail.register(UINib(nibName: IDENTIFIRE_CELL_DETAIL, bundle: nil),
                           forCellReuseIdentifier: IDENTIFIRE_CELL_DETAIL);
        
        setUp()
        presenter?.viewOnReady()
    }

    func setUp(){
    }
}

extension DetailVC: UIScrollViewDelegate{
    
}
extension DetailVC: DetailView{
    
    func showError(_ message: String){
        Alert.showInfo(message: message, on: self, callback: nil)
        
    }
    
    func showHome(_ animate: Any?) {
        
    }

    func showIndication(_ show: Bool){
        if show{
            indicatorView.startAnimating()
            indicatorView.isHidden = false
        } else {
            indicatorView.stopAnimating()
            indicatorView.isHidden = true
        }
    }
    
    func updateUI(_ type: TypePost){
        switch type {
        case .read:
            btnCallOrPost.setTitle(Messages.Detail.BUTTON_CALL, for: .normal)
            btnMsgOrEdit.setTitle(Messages.Detail.BUTTON_MESSAGE, for: .normal)
            self.navigationItem.title = Title.CONFIRM_TITLE
            
        case .write:
            btnCallOrPost.setTitle(Messages.Detail.BUTTON_POST, for: .normal)
            btnMsgOrEdit.setTitle(Messages.Detail.BUTTON_EDIT, for: .normal)
            self.navigationItem.title = Title.DETAIL_TITLE;
            
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

extension DetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 300;
        } else if indexPath.row < 6 {
            return 70;
        } else{
            return 150;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: DetailCell;
        let row = indexPath.row;
        
        if row == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIRE_CELL_IMAGE, for: indexPath) as! DetailCell;
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIRE_CELL_DETAIL, for: indexPath) as! DetailCell;
        }
        
        let post = DetailPost.shared;
        
        switch row {
        case 1:
            cell.tvDetail.text = post.title ?? "";
        case 2:
            cell.imvIcon.image = ivIconArea;
            cell.tvDetail.text = post.getStringArea()
            
        case 3:
            cell.imvIcon.image = ivIconPrice;
            cell.tvDetail.text = post.getStringPrice()
            
        case 4:
            cell.imvIcon.image = ivIconAddress;
            cell.tvDetail.text = post.getStringAddress()
            
        case 5:
            cell.imvIcon.image = ivIconType;
            cell.tvDetail.text = post.getStringType()
            
        case 6:
            cell.imvIcon.image = ivIconMore;
            cell.tvDetail.text = post.more ?? "";
            
        default:
            break;
        }

        return cell;
    }
}








