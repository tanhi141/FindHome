

import Foundation
import FirebaseDatabase
import FirebaseAuth
import Firebase

class AllPostPresenter: AllPostPresenting{
    
    private weak var view: AllPostView?;
    private weak var output: AllPostOutput?;
    
    var imageList: [UIImage]? = [];
    var postList : [DetailPost]? = [];
    var postListDisplay : [DetailPost]? = [];
    
    init(view: AllPostView, output: AllPostOutput) {
        self.view = view;
        self.output = output;
    }
    
    
    func viewOnReady() {
        fetchAllPost()
        view?.updateNavigationTitle("Trang chủ")
    }
    
    func getData() -> [DetailPost]{
        return self.postList ?? []
    }
    

    func selectPost(post: DetailPost) {
        view?.showDetailViewController(post: post, type: .read)
    }
    
    func inputSearchKeyword(_ key: String){
        applySeaching(key)
    }
}

extension AllPostPresenter{
    func applySeaching(_ keyword: String?){
        
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
    
    func fetchAllPost(){
        self.postList?.removeAll()
        let ref = Database.database().reference().child("Post")
        var existsSwitch = false
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            ref.removeAllObservers()
            if !snapshot.exists() {
                existsSwitch =  true
                return;
            }
            
            if !existsSwitch{
                self.postList?.removeAll();
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
            
            let value = post.value as? [String: Any];
            let p = DetailPost()
            
            p.title = value?["title"] as? String
            p.address?.city = value?["address"] as? String
            p.area = value?["area"] as? String
            p.idPost = value?["idPost"] as? String
            p.idUser = value?["idUser"] as? String
            p.more = value?["more"] as? String
            p.phoneNumber = value?["phoneNumber"] as? String
            p.price = value?["price"] as? Int
            p.image = self.fetchImages(p.idPost ?? "")
            p.image = self.imageList;
            list?.append(p)
        }
        return list ?? []
    }
    
    
    
    func fetchImages(_ idPost: String) -> [UIImage]{
        imageList?.removeAll()
        var list: [UIImage]? = []

        var existsSwitch = false

        let ref = Storage.storage().reference().child(idPost).child("0.jpeg")

        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error.localizedDescription);
                existsSwitch =  true
                return
            }
            if !existsSwitch{
                let image = UIImage(data: data!)
                self.imageList?.append(image ?? UIImage())
                return;
            }
        }
        return imageList ?? []
    }
}
