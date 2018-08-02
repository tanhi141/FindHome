
import Foundation

class OptionPresenter: OptionPresenting{
    
    private weak var view: OptionView?
    
    var user: User?
    init(view: OptionView, user: User){
        self.view = view;
        self.user = user
    }
    
    func viewOnReady(){
        
    }
}
