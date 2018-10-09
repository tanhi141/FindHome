
import Foundation
import FirebaseAuth
class OptionPresenter: OptionPresenting{

    private weak var view: OptionView?
    
    var user: User?
    init(view: OptionView, user: User?){
        self.view = view;
        self.user = user
    }
    
    func viewOnReady(){
        
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            Check.shared.isLogin = false;
            view?.showHome()
            
        } catch let signOutError as NSError {
            view?.showSignOutFail()
        }
        
    }
}
