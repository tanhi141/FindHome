

import Foundation

protocol AllPostOutput: class {
//    func showDetailViewControlelr(detailPost: DetailPost);
}

protocol AllPostPresenting: class {
    func viewOnReady();
    
    func getData() -> [DetailPost];
    func selectPost(post: DetailPost);
    func inputSearchKeyword(_ key: String);
}

protocol AllPostView: class {
    func updateView(_ list: [DetailPost]);
    func updateNavigationTitle(_ title: String);
    func showDetailViewController(post: DetailPost, type: TypePost);
}
