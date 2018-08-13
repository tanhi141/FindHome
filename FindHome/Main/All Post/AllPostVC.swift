 

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
        formatPrice("1000000");
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setUp() {
        let frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsets.zero);
        self.view.frame = frame;
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        
//        self.postList = presenter?.getData()
//        listDisplay = postList
        
        updateView()
        
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
            cell?.lblTitle?.text = "Không có bài đăng nào";
            cell?.imageView?.isHidden = true
            cell?.lblPrice?.isHidden = true
            cell?.lblType?.isHidden = true
            cell?.lblArea?.isHidden = true
            return cell!;
        }
           
        guard let listDisplay = listDisplay else{
            return cell!;
        }
        
        let infoPost = listDisplay[indexPath.row]
        
        cell?.lblTitle?.text = infoPost.title;
        cell?.lblArea?.text = infoPost.address?.city;
        cell?.lblType?.text = infoPost.type?.rawValue;
        cell?.lblPrice?.text = infoPost.price;
            
        
        

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
    
    func showDetailViewController(post: DetailPost) {
        let viewController = DetailVC()
        viewController.presenter = DetailPresenter(view: viewController, type: .read, post: post)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func updateView() {
        self.postList = presenter?.getData()
        listDisplay = postList
        self.tbPost.reloadData()
    }
}
 
 //MARK: AllPostVC
 extension AllPostVC{
    
    func formatPrice(_ price: String){
        print(price.count)
       
    }
 }
 
 
 
 
 
 
 
 
 
