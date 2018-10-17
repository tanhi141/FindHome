
import Foundation

class AreaAndPricePresenter: AreaAndPricePresenting{

    private weak var view: AreaAndPriceView?
    
    var area: String?
    var price: Int?
    
    
    init(view: AreaAndPriceView) {
        self.view = view
        self.area = DetailPost.shared.area ?? ""
        self.price = DetailPost.shared.price ?? 0;
    }
    
    func viewOnReady() {
        view?.showArea(self.area ?? "")
        view?.showPrice(self.price ?? 0)
    }
    
    func inputArea(_ area: String) {
        self.area = area
    }
    
    func inputPrice(_ price: Int) {
        self.price = price
    }
    
    func tappedButtonNext() {
        
        guard self.area?.isEmpty == false  else {
            //show warning
            return;
        }
        DetailPost.shared.price = self.price ?? 0
        DetailPost.shared.area = self.area ?? ""
        
        view?.showReviewViewController(animated: true)
    }
    
}

//extension AreaAndPricePresenter{
//
//}
