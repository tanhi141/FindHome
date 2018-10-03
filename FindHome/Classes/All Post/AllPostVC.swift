 

import UIKit
 
class AllPostVC: UIViewController {

    var presenter : AllPostPresenting?
    
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btnTypeSearch: UIButton!
    @IBOutlet weak var btnAreaSearch: UIButton!
    @IBOutlet weak var btnPriceSearch: UIButton!
    
    @IBOutlet weak var tbPost: UITableView!
    var postList : [DetailPost]? = []
    var listDisplay: [DetailPost]? = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        presenter?.viewOnReady()
        tbPost.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell");
        setUp()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewOnReady()
        
    }
    func setUp() {
        let frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsets.zero);
        self.view.frame = frame;
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        updateView(postList ?? [])
        tbPost.setContentOffset(.zero, animated: true)
        
    }

}
//MARK: AllPostView
extension AllPostVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listDisplay = listDisplay else {
            return 1
        }
        return listDisplay.count;
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : PostCell? = nil;
        
        cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell;
        
        if listDisplay?.count == 0 {
 
            return cell!;
        }
           
        guard let listDisplay = listDisplay else{
            return cell!;
        }
        presenter?.viewOnReady()
        let infoPost = listDisplay[indexPath.row]
        
        cell?.lblTitle?.text = infoPost.title;
        cell?.lblArea?.text = "Diện tích: \(infoPost.address?.city ?? "") m2";
        cell?.lblType?.text = "Loại: \(infoPost.type?.rawValue ?? "")";
        cell?.lblPrice?.text = "Gía:\(infoPost.price ?? "")";
        cell?.avatarImage?.image = infoPost.image?.first ?? #imageLiteral(resourceName: "homeDemo")
        
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let listDisplay = listDisplay else {
            return
        }
        
        presenter?.selectPost(post: listDisplay[indexPath.row])
    }
    

    
}

//MARK: AllPostView
 extension AllPostVC: AllPostView{
    
    func showDetailViewController(post: DetailPost, type: TypePost) {
        let viewController = DetailVC()
        viewController.presenter = DetailPresenter(view: viewController, type: type, post: post)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func updateView(_ list: [DetailPost]) {
        self.listDisplay = list
        self.tbPost.reloadData()
    }
    
    func updateNavigationTitle(_ title: String){
        navigationItem.title = title
    }
}
 
 //MARK: AllPostVC
 extension AllPostVC{
    
    func formatPrice(_ price: String){
        print(price.count);
    }
    
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
 }
 
 
 extension AllPostVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        presenter?.inputSearchKeyword(tfSearch.text ?? "")
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view?.endEditing(true);
        return true;
    }
 }
 
 
 
 
 
 
