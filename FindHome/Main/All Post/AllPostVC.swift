

import UIKit

class AllPostVC: UIViewController {

    var presenter : AllPostPresenting?
    
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btnTypeSearch: UIButton!
    @IBOutlet weak var btnAreaSearch: UIButton!
    @IBOutlet weak var btnPriceSearch: UIButton!
    
    @IBOutlet weak var tbPost: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter?.viewOnReady()
        
        tbPost.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell");
    }
    
    func setUp() {
        let frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsets.zero);
        self.view.frame = frame;
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight];
    }

}
//MARK: AllPostView
extension AllPostVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : PostCell? = nil;
        cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
}

//MARK: AllPostView
extension AllPostVC: AllPostView{
    func updateView() {
        
    }
}
