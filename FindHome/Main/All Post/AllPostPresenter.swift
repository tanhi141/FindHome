

import Foundation
import FirebaseDatabase
import Firebase

class AllPostPresenter: AllPostPresenting{
    
    private weak var view: AllPostView?;

    var postList : [DetailPost] = []
    
    init(view: AllPostView) {
        self.view = view;
        
    }
    
    func viewOnReady() {
        view?.updateView()
        fetchAllPost()
    }
    
    func fetchAllPost(){
        
            
//        let ref = Database.database().reference().child("Post")
//        
//        ref.observeSingleEvent(of: .value, with: {[weak self] snapshot in
//            
//            if !snapshot.exists() {
//                return
//            }
//            
//            let user = snapshot.value as! [String: Any]
//            let infoUser = user.values.first as? [String: String]
            
//            User.share.email = infoUser?["email"]  ?? ""
//            User.share.fullName = infoUser?["fullName"] ?? ""
//            User.share.phonenNumber = infoUser?["phoneNumber"] ?? ""
//            User.share.idUser = infoUser?["idUser"] ?? ""
            
        })
        
        
    }
}
