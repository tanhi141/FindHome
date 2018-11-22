
import UIKit

class TypeVC: UIViewController {
    let IDENTIFIER_CELL = "TypeCell";
    var presenter: TypePresenter?
    
    @IBOutlet weak var tbType: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    
    let imageSelected = UIImage.init(named: "ic_selected");
    let imageDeselected = UIImage.init(named: "ic_disselect");
    
    var type: Type?
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        tbType.register(UINib(nibName: "TypeCell", bundle: nil), forCellReuseIdentifier: "TypeCell");
        presenter?.viewOnReady()
    }

    func setUp(){
        navigationItem.title = "Loại";
        tbType.isScrollEnabled = false
        btnNext.setNextStyle();
    }
}


extension TypeVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : TypeCell? = nil
        cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_CELL, for: indexPath) as? TypeCell;
        
        let row = indexPath.row
        let type = self.type ?? Type.Unknow;
        if row == 0 {
            cell?.lblType.text = Type.House.rawValue
            if type == .House {
                cell?.isSelected = true;
                cell?.icImageView.image = self.imageSelected
            } else {
                cell?.isSelected = false
                cell?.icImageView.image = self.imageDeselected;
            }
            
        } else if row == 1{
            cell?.lblType.text = Type.Room.rawValue
            if type == .Room {
                cell?.isSelected = true;
                cell?.icImageView.image = self.imageSelected
            } else {
                cell?.isSelected = false
                cell?.icImageView.image = self.imageDeselected;
            }
            
        } else if row == 2{
            cell?.lblType.text = Type.WithWhom.rawValue
            if type == .WithWhom {
                cell?.isSelected = true;
                cell?.icImageView.image = self.imageSelected
            } else {
                cell?.isSelected = false
                cell?.icImageView.image = self.imageDeselected;
            }
            
        } else if row == 3{
            cell?.lblType.text = Type.Kiot.rawValue
            if type == .Kiot {
                cell?.isSelected = true;
                cell?.icImageView.image = self.imageSelected
            } else {
                cell?.isSelected = false
                cell?.icImageView.image = self.imageDeselected;
            }
        }
        
     
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if row == 0 {
            presenter?.inputType(Type.House)
        } else if row == 1{
            presenter?.inputType(Type.Room)
        } else if row == 2{
            presenter?.inputType(Type.WithWhom)
        } else if row == 3{
            presenter?.inputType(Type.Kiot)
        }
    }
}

extension TypeVC: TypeView{
    func showError(message: String) {
        Alert.showInfo(message: message, on: self, callback: nil);
    }
    
    func getType(type: Type?){
        self.type = type;
        tbType.reloadData()

    }
    
    //output
    func showAddressViewController(animated: Bool?){
        let viewController = AddressVC()
        viewController.presenter = AddressPresenter(view: viewController)
        navigationController?.pushViewController(viewController, animated: animated!)
    }
    
    
}

extension TypeVC{
    @IBAction func tapButtonNext(_ sender: Any){
        self.view.endEditing(true)
        presenter?.tappedButtonNext()
    }
}
