
import Foundation

protocol AddressOutput: class {
    
}

protocol AddressView:class {
    func showAddress(_ address: String);
    func showAddress(cell: AddressCell, _ address: String)
    func showError(_ message: String);
    func showAreaAndPrice(animated: Bool?)
    

}


protocol AddressPresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();

    func inputAddress(_ address: String)

}

