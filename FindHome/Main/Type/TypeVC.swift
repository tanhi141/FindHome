
import UIKit

class TypeVC: UIViewController {

    var presenter: TypePresenter?
    
    @IBOutlet weak var tbType: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    
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
        cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath) as? TypeCell;
        
        let row = indexPath.row
        if row == 0 {
            cell?.lblType.text = Type.House.rawValue
        } else if row == 1{
            cell?.lblType.text = Type.Room.rawValue
        } else if row == 2{
            cell?.lblType.text = Type.WithWhom.rawValue
        } else if row == 3{
            cell?.lblType.text = Type.Kiot.rawValue
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
    func updateTableView(currentType: Type?) {
        guard type != nil else{
            return
        }
        var cell = TypeCell()
        switch currentType! {
        case .House:
            cell = tbType.cellForRow(at: IndexPath(row: 0, section: 0)) as! TypeCell;
        case .Room:
            cell = tbType.cellForRow(at: IndexPath(row: 1, section: 0)) as! TypeCell;
        case .WithWhom:
            cell = tbType.cellForRow(at: IndexPath(row: 2, section: 0)) as! TypeCell;
        case .Kiot:
            cell = tbType.cellForRow(at: IndexPath(row: 3, section: 0)) as! TypeCell;
        default:
            break
        }
        
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
