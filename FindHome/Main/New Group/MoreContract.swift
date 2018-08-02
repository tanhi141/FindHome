
import Foundation

protocol MoreView:class {
//    func updateCollectionView(currentType: Type?);
    
    func showTitle(_ title: String)
    func showMore(_ more: String)
    
    func showWarning()
    
    //output
    func showImageiewController(animated: Bool?);
    
}


protocol MorePresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();
    func inputTitle(_ title: String)
    func inputMore(_ more: String)
    
}

