
import Foundation

protocol TypeOutput: class {
    
}

protocol TypePresenting:class {
    func viewOnReady()
    
    func tappedButtonNext();
    func inputType(_ type: Type);
}

protocol TypeView:class {
    func updateTableView(currentType: Type?);
    func showAddressViewController(animated: Bool?)
//    func showAreaAndPrice(animated: Bool?)
    
}

