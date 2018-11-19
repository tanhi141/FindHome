

import Foundation
import FirebaseDatabase
class HistoryPresenter: AllPostPresenting{
    
    private weak var view: AllPostVC?
    private weak var output: AllPostOutput?
    
    var postList : [DetailPost]? = []
    var postListDisplay: [DetailPost]? = []
    
    var keyword: String? = ""
    init(view: AllPostVC, output: AllPostOutput){
        self.view = view;
        self.output = output;
    }
    
    func viewOnReady() {
        fetchMyPost()
        view?.updateNavigationTitle(Title.HISTORY_TITLE);
    }
    
    func getData() -> [DetailPost] {
        return self.postList ?? [];
    }
    
    func selectPost(post: DetailPost) {
        view?.showDetailViewController(post: post, type: .write)
        DetailPost.shared = post;
    }
    
    func inputSearchKeyword(_ key: String) {
        self.keyword = key;
        applySeaching(key);
    }
    
}

extension HistoryPresenter{
    
    func fetchMyPost(){
//        
//        let ref = Database.database().reference().child("Post").queryOrdered(byChild: "idUser").queryEqual(toValue: User.shared.idUser ?? "")
//        var existsSwitch = false
//        ref.observeSingleEvent(of: .value, with: { snapshot in
//            ref.removeAllObservers()
//            if !snapshot.exists() {
//                existsSwitch =  true
//                return;
//            }
//            
//            if !existsSwitch{
//                self.postList = self.fetchAll(snapshot: snapshot);
//                self.view?.updateView(self.postList ?? [])
//                return;
//            }
//            
//        })
        
    }
    
    func fetchAll(snapshot : DataSnapshot?) -> [DetailPost]{
        
        guard let snapshot = snapshot else {
            return []
        }
        var list : [DetailPost]? = []
        let postList = snapshot.value as! [String: Any]
        
        for post in postList{
            
            let value = post.value as? [String: Any];
            let p = DetailPost()
            
            p.title = value?["title"] as? String;
            p.address?.city = value?["address"] as? String
            p.area = value?["area"] as? String
            p.idPost = value?["idPost"] as? String
            p.idUser = value?["idUser"] as? String
            p.more = value?["more"] as? String
            p.phoneNumber = value?["phoneNumber"] as? String
            p.price = value?["price"] as? Int;
//            p.image = self.fetchImages(p.idPost ?? "")
//            p.image =
//            p.image = self.imageList;            
            list?.append(p)
        }
        return list ?? []
    }
    
    func applySeaching(_ keyword: String?
        ){
        guard let keyword = keyword,
            keyword.isEmpty == false else {
                postListDisplay = postList;
                view?.updateView(postList ?? []);
                return;
        }
        
        postListDisplay = postList?.filter {
            ($0.title?.localizedCaseInsensitiveContains(keyword))!
                || ($0.phoneNumber?.localizedCaseInsensitiveContains(keyword))!
                || ($0.address?.city?.localizedCaseInsensitiveContains(keyword))!
                || ($0.type?.rawValue.localizedCaseInsensitiveContains(keyword))!
            
        };
        view?.updateView(postListDisplay ?? [])
    }
}
