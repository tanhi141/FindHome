
import Foundation

class MorePresenter: MorePresenting{
    
    private weak var view: MoreView?
    
    var title: String?
    var more: String?
    
    
    init(view: MoreView) {
        self.view = view
        self.title = DetailPost.shared.title ??  ""
        self.more = DetailPost.shared.more ??  ""
    }
    
    func viewOnReady() {
        view?.showTitle(self.title ?? "")
        view?.showMore(self.more ?? "")
    }
    
    func tappedButtonNext() {
        guard self.title?.isEmpty == false && self.more?.isEmpty == false else{
            view?.showWarning()
            return
        }
        
        view?.showImageiewController(animated: true)
    }
    
    func inputTitle(_ title: String) {
        self.title = title
    }
    
    func inputMore(_ more: String) {
        self.more = more
    }
}
