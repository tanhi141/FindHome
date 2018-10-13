
import Foundation
import FirebaseAuth
class OptionPresenter: OptionPresenting{

    private weak var view: OptionView?
    private weak var output: OptionOutput?
    
//    var user: User?
    init(view: OptionView,output: OptionOutput){
        self.view = view;
//        self.user = user
    }
    
    func viewOnReady(){
        
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            Check.shared.isLogin = false;
            view?.showHome()
            
        } catch let _ as NSError {
            view?.showSignOutFail()
        }
    }
}
