

import Foundation
class AllPostPresenter: AllPostPresenting{
    
    private weak var view: AllPostView?;
    private weak var output: AllPostOutput?;
    
    init(view: AllPostView, output: AllPostOutput) {
        self.view = view;
        self.output = output
    }
    
    func viewOnReady() {
        view?.updateView()
    }
}
