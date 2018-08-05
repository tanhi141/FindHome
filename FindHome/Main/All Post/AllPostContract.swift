

import Foundation

protocol AllPostOutput: class {
    
}

protocol AllPostPresenting: class {
    func viewOnReady();
    
    func fetchAllPost()
}

protocol AllPostView: class {
    func updateView()
}
