

import Foundation
import FirebaseDatabase
import FirebaseAuth
import Firebase

class AllPostPresenter: AllPostPresenting{
    
    private weak var view: AllPostView?;
    
    var postList : [DetailPost]? = []
    
    init(view: AllPostView) {
        self.view = view;
    }
    
    func viewOnReady() {
        fetchAllPost()
        view?.updateNavigationTitle("Trang chủ")
    }
    
    func getData() -> [DetailPost]{
        return self.postList ?? []
    }
    

    func selectPost(post: DetailPost) {
        view?.showDetailViewController(post: post)
    }
    
    func inputSearchKeyword(_ key: String){
        
    }
}

extension AllPostPresenter{
//    var postList: [DetailPost]? = [];
    
    func fetchAllPost(){
        
        let ref = Database.database().reference().child("Post")
        var existsSwitch = false
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            ref.removeAllObservers()
            if !snapshot.exists() {
                existsSwitch =  true
                return;
            }
            
            if !existsSwitch{
                self.postList = self.fetchAll(snapshot: snapshot);
                self.view?.updateView(self.postList ?? [])
                return;
            }
            
        })
        
//        return;
    }
    
    func fetchAll(snapshot : DataSnapshot?) -> [DetailPost]{
        
                guard let snapshot = snapshot else {
                    return []
                }
                var list : [DetailPost]? = []
                let postList = snapshot.value as! [String: Any]
        
                for var post in postList{
        
                    let value = post.value as? [String: String];
                    let p = DetailPost()
        
                    p.title = value?["title"] ?? "";
                    p.address?.city = value?["address"] ?? "";
                    p.area = value?["area"] ?? "";
                    p.idPost = value?["idPost"] ?? "";
                    p.idUser = value?["idUser"] ?? "";
                    p.more = value?["more"] ?? "";
                    p.phoneNumber = value?["phoneNumber"] ?? "";
                    p.price = value?["price"] ?? "";
        
                    list?.append(p)
                }
                return list ?? []
            }
}
