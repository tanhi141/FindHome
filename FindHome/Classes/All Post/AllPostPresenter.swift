

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
                || ($0.address?.localizedCaseInsensitiveContains(keyword))!
            || ($0.type?.rawValue.localizedCaseInsensitiveContains(keyword))!
            
            
        };
        view?.updateView(postListDisplay ?? [])
    }
    
    func fetchAllPost(){
        FBAccountManager.shared.fetchAllPost { (result, listPost) in
            if result{
                self.postList = listPost;
            }
            
            
        }
    }
    
   
}
