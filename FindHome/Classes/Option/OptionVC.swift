
import UIKit

class OptionVC: UIViewController {

    var presenter: OptionPresenting?
    
    @IBOutlet weak var tbOption: UITableView!
    
    let IDENTIFIRE_CELL = "OptionCell";
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbOption.register(UINib(nibName: IDENTIFIRE_CELL, bundle: nil), forCellReuseIdentifier: IDENTIFIRE_CELL);

    }


}

extension OptionVC: OptionView{
    
    func showSignOutFail() {
        Alert.showInfo(message: Messages.Option.ERROR_SIGNOUT_FAILED, on: self, callback: nil)
    }
    
    func showHome(){
//        let vc = HomeVC()
//        self.navigationController?.pushViewController(vc, animated: true)
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
        cell = tbOption.dequeueReusableCell(withIdentifier: IDENTIFIRE_CELL, for: indexPath) as? OptionCell;
        
        switch indexPath.row {
        case 0:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_user")
            cell?.lblOption.text = Title.Option.ACCOUNT_BUTTON;
            if Check.shared.isLogin == false{
                cell?.selectionStyle = .none
                cell?.lblOption.textColor = .gray
            }
            break;
        
        case 1:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_edit-1")
            cell?.lblOption.text = Title.Option.EDIT_INFO_BUTTON;
            break;
        
        case 2:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_editPass")
            cell?.lblOption.text = Title.Option.EDIT_PASSWORD_BUTTON;
            break;
            
        case 3:
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_register")
            cell?.lblOption.text = Title.Option.SIGNUP_BUTTON;
            
            break;
        case 4:
            
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_help")
            cell?.lblOption.text = Title.Option.SUPPORT_BUTTON
            break;
        
        case 5:
            
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_setting")
            cell?.lblOption.text = Title.Option.SETTING_BUTTON
            break;
            
        case 6:
           
            cell?.iconImage.image = #imageLiteral(resourceName: "ic_logOut")
            cell?.lblOption.text = Title.Option.SIGNOUT_BUTTON;
            if Check.shared.isLogin == false{
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
           
            if Check.shared.isLogin{
                 presenter?.signOut()
            }
        default:
            break
        }
    }
}
