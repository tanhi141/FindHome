
import Foundation

class TypePresenter: TypePresenting{

    private weak var view: TypeView?
    
    var type: Type?;
    init(view: TypeView) {
        self.view = view
        
        self.type = DetailPost.shared.type
    }
    
    func viewOnReady(){
        let currentType = DetailPost.shared.type
        
        view?.updateTableView(currentType: currentType)
    }
    
    func tappedButtonNext(){
        guard self.type != nil else {
            //hiện label thông báo
            return;
        }
        
        DetailPost.shared.type = self.type
        view?.showAddressViewController(animated: true)
    }
    func inputType(_ type: Type) {
        self.type = type
    }
}
