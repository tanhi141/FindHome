
import UIKit

class OptionVC: UIViewController {

    var presenter: OptionPresenting?
    
    @IBOutlet weak var tbOption: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbOption.register(UINib(nibName: "OptionCell", bundle: nil), forCellReuseIdentifier: "OptionCell");

    }


}

extension OptionVC: OptionView{
    
    func showSignOutFail() {
        Alert.showInfo(title: "Thông báo", message: "Đăng xuất thất bại!", on: self, callback: nil)
    }
    
    func showHome(){
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension OptionVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: OptionCell? = nil;
        cell = tbOption.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as! OptionCell;
        
        switch indexPath.row {
        case 0:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_user")
            cell?.lblOption.text = "Tài khoản";
            if Check.checkAll.isLogin == false{
                cell?.selectionStyle = .none
                cell?.lblOption.textColor = .gray
            }
            break;
        
        case 1:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_edit-1")
            cell?.lblOption.text = "Chỉnh sửa thông tin";
            break;
        
        case 2:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_editPass")
            cell?.lblOption.text = "Đổi mật khẩu";
            break;
            
        case 3:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_register")
            cell?.lblOption.text = "Đăng ký tài khoản";
            
            break;
        case 4:
            
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_help")
            cell?.lblOption.text = "Hỗ trợ";
            break;
        
        case 5:
            
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_setting")
            cell?.lblOption.text = "Cài đặt";
            break;
            
        case 6:
           
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_logOut")
            cell?.lblOption.text = "Đăng xuất";
            if Check.checkAll.isLogin == false{
                cell?.selectionStyle = .none
                cell?.lblOption.textColor = .gray
            }
            break;
        default:
            break;
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            let viewController = RegisterVC()
            self.navigationController?.pushViewController(viewController, animated: true)
        case 6:
           
            if Check.checkAll.isLogin{
                 presenter?.signOut()
            }
        default:
            break
        }
    }
}
