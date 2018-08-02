
import Foundation

class ReviewPresenter: ReviewPresenting{
    
    private weak var view: ReviewView?
    
    var title: String?
    var more: String?
    
    init(view: ReviewView) {
        self.view = view
        
        self.title = DetailPost.shared.title ?? ""
        self.more = DetailPost.shared.more ?? ""
        
    }
    
    func viewOnReady() {
        view?.showTitle(title ?? "")
        view?.showMore(more ?? "")
    }
    
    func inputTitle(_ title: String) {
        self.title = title
    }
    
    func inputMore(_ more: String) {
        self.more = more
    }
    
    func tappedButtonNext() {
        guard self.title?.isEmpty == false && self.more?.isEmpty == false else {

            return
        }
        
        DetailPost.shared.title = self.title
        DetailPost.shared.more = self.more
        
        self.view?.showImageViewController(animated: true)
    }
    
    
}

extension AreaAndPricePresenter{
    
}
