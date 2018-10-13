

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
        
        let ref = Database.database().reference().child("Post").queryOrdered(byChild: "idUser").queryEqual(toValue: User.shared.idUser ?? "")
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
        
    }
    
    func fetchAll(snapshot : DataSnapshot?) -> [DetailPost]{
        
        guard let snapshot = snapshot else {
            return []
        }
        var list : [DetailPost]? = []
        let postList = snapshot.value as! [String: Any]
        
        for post in postList{
            
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
                || ($0.price?.localizedCaseInsensitiveContains(keyword))!
            
        };
        view?.updateView(postListDisplay ?? [])
    }
}
