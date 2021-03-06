
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
        
//        4.10. Xử lý chi tiết
//        4.10.(1) Hiển thị ban đầu
//        4.10.(2) Xử lý check
//        4.10.(1).1: Diện tích
//        4.10.(1).2: Giá cho thuê
        
        guard self.area?.isEmpty == false, self.price != nil  else {
            self.view?.showError(Messages.Area.ERROR_REQUIRED);
            return;
        }
        
        DetailPost.shared.price = self.price ?? 0
        DetailPost.shared.area = self.area ?? ""
        
        view?.showReviewViewController(animated: true)
    }
}

