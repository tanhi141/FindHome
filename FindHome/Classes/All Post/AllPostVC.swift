 

import UIKit
 
class AllPostVC: UIViewController {

    let IDENTIFIER_CELL = "PostCell";
    var presenter : AllPostPresenting?
    
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tbPost: UITableView!
    
    var postList : [DetailPost] = [];
    var postListDisplay: [DetailPost] = []{
        didSet{
            tbPost.reloadData();
        }
    };
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        presenter?.viewOnReady()
        self.postList = presenter?.getData();
        self.postListDisplay = presenter?.getData();
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewOnReady()
        
    }
    func setUp() {
        tbPost.register(UINib(nibName: IDENTIFIER_CELL, bundle: nil),
                        forCellReuseIdentifier: IDENTIFIER_CELL);
        setTitleNavigation(title: Title.ALL_POST_TITLE);
        updateView(postList ?? []);
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWithTapGesture(_:)));
        self.view.addGestureRecognizer(tap);
    }

}
//MARK: AllPostView
extension AllPostVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listDisplay = postListDisplay else {
            return 1
        }
        return listDisplay.count;
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : PostCell? = nil;
        
        cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_CELL, for: indexPath) as? PostCell;

           
        guard let listDisplay = postListDisplay, listDisplay.count > 0  else{
            return cell!;
        }
        
        let infoPost = listDisplay[indexPath.row]
        
        cell?.lblTitle?.text = infoPost.title;
        cell?.lblArea?.text = infoPost.getStringArea();
        cell?.lblType?.text = infoPost.getStringType();
        cell?.lblPrice?.text = infoPost.getStringPrice();
        cell?.avatarImage?.image = infoPost.image?.first ?? #imageLiteral(resourceName: "homeDemo");
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let listDisplay = postListDisplay else {
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
        self.postListDisplay = list
        self.postList = list
        self.tbPost.reloadData()
    }
    
    func updateNavigationTitle(_ title: String){
        navigationItem.title = title
    }
}
 
 //MARK: Action
 extension AllPostVC{
    
    @objc func dismissKeyboardWithTapGesture(_ tap: UIGestureRecognizer?) {
        self.view?.endEditing(true);
    }
 }
 
 //MARK: - UITextFieldDelegate
 extension AllPostVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view?.endEditing(true);
        return true;
    }

    @IBAction func onDidChanged(_ textfield: UITextField){
        guard let keyword = textfield.text,
            keyword.isEmpty == false else {
                postListDisplay = postList;
                tbPost.reloadData();
                return;
        }
        
        applySearch(keyword);
        tbPost.reloadData();
        return;
        
        
    }
}
 
 //MARK: - Other
 extension AllPostVC{

    func applySearch(_ keyword: String?){
        if keyword?.isEmpty == true{
            self.postListDisplay = self.postList;
            return;
        }
        
        postListDisplay = postList?.filter {
            ($0.title?.localizedCaseInsensitiveContains(keyword ?? ""))!
                || ($0.address?.localizedCaseInsensitiveContains(keyword ?? ""))!
                || ($0.type?.rawValue.localizedCaseInsensitiveContains(keyword ?? ""))!
        };
    }
 }
 
