
import Foundation

protocol TypeOutput: class {
    
}

protocol TypePresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();
    func inputType(_ type: Type);
}

protocol TypeView:class {
    func getType(type: Type?);
    func showAddressViewController(animated: Bool?)
    func showError(message: String);
//    func showAreaAndPrice(animated: Bool?)
    
}

