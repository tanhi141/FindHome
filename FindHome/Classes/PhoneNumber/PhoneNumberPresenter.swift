
import Foundation

class PhoneNumberPresenter: PhoneNumberPresenting{
    let PHONENUMBER_COUNT = 10;
    
    private weak var view: PhoneNumberView?
    private weak var output: PhoneNumberOutput?
    
    var phoneNumber: String?
    
    init(view: PhoneNumberView,output: PhoneNumberOutput) {
        self.view = view;
        self.output = output;
    }
    
    func viewOnReady(){
        if let phoneNumber = DetailPost.shared.phoneNumber{
            view?.showPhoneNumber(phoneNumber: phoneNumber)
            
        } else{
            view?.showPhoneNumber(phoneNumber: User.currentUserLogin.phonenNumber  ?? "")
        }
        
    }
    func tappedButtonNext(){
//        10. Xử lý chi tiết
//        10.(2) Xử lý check
//        10.(2).1. Số điện thoại
        
        guard let phoneNumber = self.phoneNumber else{
            view?.showError()
            return
        }
        //10.(2).1.2.
        guard phoneNumber.count == PHONENUMBER_COUNT else {
            view?.showError();
            return;
        }
        
        DetailPost.shared.phoneNumber = phoneNumber;
        output?.phoneNumberOutput(nil);
    }
    
    func inputPhoneNumber(_ phoneNumber: String){
        self.phoneNumber = phoneNumber
        view?.showPhoneNumber(phoneNumber: phoneNumber)
    }
}

extension PhoneNumberPresenter{
    func savePhoneNumber(){
        
    }
}
