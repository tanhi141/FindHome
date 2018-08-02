
import Foundation
class ViewControllerPresenter: ViewControllerPresenting{
    
    private var view: ViewControllerView?
    private var output: ViewControllerOutput?
    
    init(view: ViewControllerView, output: ViewControllerOutput) {
        self.view = view
        self.output = output;
    }
}
