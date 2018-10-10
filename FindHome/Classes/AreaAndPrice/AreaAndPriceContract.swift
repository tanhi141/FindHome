
import Foundation


protocol AreaAndPriceView:class {
    func updateTableView(currentType: Type?);

    func showArea(_ area: String)
    func showPrice(_ price: String)
    
    func showWarning()
    
    //output
    func showReviewViewController(animated: Bool?);
    
}


protocol AreaAndPricePresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();
    func inputArea(_ area: String)
    func inputPrice(_ price: String)

}
