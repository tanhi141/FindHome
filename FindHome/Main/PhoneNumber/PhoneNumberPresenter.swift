
import Foundation

class PhoneNumberPresenter: PhoneNumberPresenting{
    private weak var view: PhoneNumberView?
    
    var phoneNumber: String?
    
    init(view: PhoneNumberView) {
        self.view = view;
        
        self.phoneNumber = DetailPost.shared.phoneNumber ?? ""

    }
    
    func viewOnReady(){
        view?.showPhoneNumber(phoneNumber: phoneNumber ?? "")
    }
    func tappedButtonNext(){
        
        guard !(phoneNumber?.isEmpty)! else{
            view?.showError()
            return
        }
        
        DetailPost.shared.phoneNumber = phoneNumber;
        view?.phoneNumberOutput(true);
    }
    
    func inputPhoneNumber(_ phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
}

extension PhoneNumberPresenter{
    func savePhoneNumber(){
        
    }
}
