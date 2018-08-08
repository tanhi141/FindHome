

import Foundation

protocol AllPostOutput: class {
    
}

protocol AllPostPresenting: class {
    func viewOnReady();
    
    func getData() -> [DetailPost];
}

protocol AllPostView: class {
    func updateView()
}
