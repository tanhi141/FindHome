
import Foundation

protocol AddressOutput: class {
    
}

protocol AddressView:class {
    
    func showAddress(cell: AddressCell, _ address: String)
    func showCity(_ city: String)
    func showStreet(_ street: String)
    func showDistrict(_ district: String)
    func showWard(_ ward: String)
    func showError();
    func showAreaAndPrice(animated: Bool?)

}


protocol AddressPresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();

    func inputCity(_ city: String)
    func inputStreet(_ street: String)
    func inputDistrict(_ district: String)
    func inputWard(_ ward: String)
}

