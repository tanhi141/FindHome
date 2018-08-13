

import Foundation

protocol AllPostOutput: class {
//    func showDetailViewControlelr(detailPost: DetailPost);
}

protocol AllPostPresenting: class {
    func viewOnReady();
    
    func getData() -> [DetailPost];
    func selectPost(post: DetailPost);
}

protocol AllPostView: class {
    func updateView();
    func showDetailViewController(post: DetailPost)
}
