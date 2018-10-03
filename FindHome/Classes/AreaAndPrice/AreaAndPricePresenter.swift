
import Foundation

class AreaAndPricePresenter: AreaAndPricePresenting{

    private weak var view: AreaAndPriceView?
    
    var area: String?
    var price: String?
    
    
    init(view: AreaAndPriceView) {
        self.view = view
        self.area = DetailPost.shared.area ?? ""
        self.price = DetailPost.shared.price ?? ""
    }
    
    func viewOnReady() {
        view?.showArea(self.area ?? "")
        view?.showPrice(self.price ?? "")
    }
    
    func inputArea(_ area: String) {
        self.area = area
    }
    
    func inputPrice(_ price: String) {
        self.price = price
    }
    
    func tappedButtonNext() {
        
        guard self.area?.isEmpty == false && self.price?.isEmpty == false  else {
            //show warning
            return;
        }
        DetailPost.shared.price = self.price ?? ""
        DetailPost.shared.area = self.area ?? ""
        
        view?.showReviewViewController(animated: true)
    }
    
}

//extension AreaAndPricePresenter{
//
//}
