

import Foundation
import FirebaseDatabase
class MyPostPresenter: AllPostPresenting{
    
    private weak var view: AllPostVC?
    
    var postList : [DetailPost]? = []

    init(view: AllPostVC){
        self.view = view
    }
    
    func viewOnReady() {
        fetchMyPost()
    }
    
    func getData() -> [DetailPost] {
        return self.postList ?? []
    }
    
    func selectPost(post: DetailPost) {
        view?.showDetailViewController(post: post)
    }
}

extension MyPostPresenter{
    
    func fetchMyPost(){
        
        let ref = Database.database().reference().child("Post").queryOrdered(byChild: "idUser").queryEqual(toValue: User.share.idUser ?? "")
        print(User.share.idUser)
        var existsSwitch = false
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            ref.removeAllObservers()
            if !snapshot.exists() {
                existsSwitch =  true
                return;
            }
            
            if !existsSwitch{
                self.postList = self.fetchAll(snapshot: snapshot);
                self.view?.updateView()
                return;
            }
            
        })
        
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
        print(list?.count)
        return list ?? []
    }
}
