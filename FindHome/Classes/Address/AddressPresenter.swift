
import Foundation

class AddressPresenter: AddressPresenting{

    private weak var view: AddressView?
    
    var address: String;
   
    init(view: AddressView) {
        self.view = view;
        self.address =  DetailPost.shared.address ?? "";
    }
    
    func viewOnReady(){
        view?.showAddress(self.address)
    }
    
    func tappedButtonNext(){
//        3.10. Xử lý chi tiết
//        (1) Hiển thị ban đầu
//        (2) Xử lý check
        //1.Địa chỉ
        guard self.address.count > 0 else {
            view?.showError(Messages.Address.ERROR_REQUIRED);
            return
        }
    
        DetailPost.shared.address = self.address
        view?.showAreaAndPrice(animated: true);
    }
    
    func inputAddress(_ address: String) {
        self.address = address;
    }


}

