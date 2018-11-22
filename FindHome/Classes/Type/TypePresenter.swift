
import Foundation

class TypePresenter: TypePresenting{

    private weak var view: TypeView?
    private weak var output: TypeOutput?
    
    var type: Type?;
    
    init(view: TypeView, output: TypeOutput) {
        self.view = view;
        self.output = output;
        
        
        
    }
    
    func viewOnReady(){
        self.type = DetailPost.shared.type;
        view?.getType(type: type);
        
        
    }
    
    func tappedButtonNext(){
//        1.10. Xử lý chi tiết
//        1.10.(1) Hiển thị ban đầu
//        1.10.(2) Xử lý check
        guard self.type != nil else {
            view?.showError(message: Messages.TypeOption.ERROR_REQUIRED);
            return;
        }
        
        DetailPost.shared.type = self.type;
        view?.showAddressViewController(animated: true)
    }
    func inputType(_ type: Type) {
        self.type = type
        DetailPost.shared.type = type
    }
}
