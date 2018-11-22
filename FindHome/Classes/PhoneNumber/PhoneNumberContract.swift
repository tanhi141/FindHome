
import Foundation

protocol PhoneNumberOutput:class {
    func phoneNumberOutput(_ showType: Any?);
    
}

protocol PhoneNumberPresenting:class {
    func viewOnReady();
    
    func tappedButtonNext();
    func inputPhoneNumber(_ phoneNumber: String)
    
}


protocol PhoneNumberView:class {
    func showPhoneNumber(phoneNumber: String);
    func showError();
}
