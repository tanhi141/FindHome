
import Foundation

class AddressPresenter: AddressPresenting{

    private weak var view: AddressView?
    
    var city: String?
    var street: String?
    var district: String?
    var ward: String?
    
    let address = DetailPost.shared.address
    init(view: AddressView) {
        self.view = view
        self.city = address?.city
        self.street = address?.street ?? ""
        self.district = address?.district ?? ""
        self.ward = address?.ward ?? ""
    }
    
    func viewOnReady(){
        view?.showCity(address?.city ?? "")
        view?.showWard(address?.ward ?? "")
        view?.showDistrict(address?.district ?? "")
        view?.showDistrict(address?.district ?? "")
    }
    
    func tappedButtonNext(){
        if self.city?.isEmpty == false ||
            self.district?.isEmpty == false{
            print("thieu");
        }
        
        DetailPost.shared.address?.city = self.city
        DetailPost.shared.address?.district = self.district
        DetailPost.shared.address?.ward = self.ward
        DetailPost.shared.address?.street = self.street
        
        view?.showAreaAndPrice(animated: true);
    }
    
    func inputAddress(_ address: String) {
        
    }
    
    func inputCity(_ city: String) {
        self.city = city
    }
    
    func inputStreet(_ street: String) {
        self.street = street
    }
    
    func inputDistrict(_ district: String) {
        self.district = district
    }
    
    func inputWard(_ ward: String) {
        self.ward = ward
    }
}

