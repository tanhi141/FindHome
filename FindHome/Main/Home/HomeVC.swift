
import UIKit

class HomeVC: UITabBarController {

    var allPostVC: UIViewController?
    var myPostVC: UIViewController?
    var postVC: UIViewController?
    var optionVC: UIViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUp()
        addTabBar()
        
    }
    
    func setUp(){
        
        allPostVC = AllPostVC()
        myPostVC = AllPostVC()
        optionVC = OptionVC()
        
        if Check.checkAll.isLogin == true{
            postVC = PhoneNumberVC()
        } else {
            postVC = Login()
        }

        self.navigationItem.title = "Trang chủ"
    }
}



extension HomeVC{
    func addTabBar(){
        
        let imgHomes = UIImage(named: "ic_homes");
        let imgHome = UIImage(named: "ic_home");
        let imgPost = UIImage(named: "ic_post");
        let imgMore = UIImage(named: "ic_more");
        
        
//        allPostVC?.tabBarItem.image = uii
        allPostVC?.tabBarItem = UITabBarItem.init(title: "Trang Chủ", image: imgHomes, tag: 0);
        myPostVC?.tabBarItem = UITabBarItem.init(title: "Của Tôi", image: imgHome, tag: 1);
        postVC?.tabBarItem = UITabBarItem.init(title: "Đăng bài", image: imgPost, tag: 2);
        optionVC?.tabBarItem = UITabBarItem.init(title: "Thêm", image: imgMore , tag: 3)
        
        allPostVC?.tabBarItem.image=UIImage(named: "ic_homes")?.withRenderingMode(.alwaysOriginal)
        myPostVC?.tabBarItem.image=UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal)
        postVC?.tabBarItem.image=UIImage(named: "ic_post")?.withRenderingMode(.alwaysOriginal)
        optionVC?.tabBarItem.image=UIImage(named: "ic_more")?.withRenderingMode(.alwaysOriginal)
        
        self.viewControllers = [allPostVC, myPostVC, postVC, optionVC] as? [UIViewController];
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item === allPostVC?.tabBarItem{
            navigationItem.title = "Trang chủ";
        } else if item === myPostVC?.tabBarItem{
            navigationItem.title = "Của tôi";
        } else if item === postVC?.tabBarItem{
            
            if Check.checkAll.isLogin == true{
                navigationItem.title = "Số điện thoại";
            } else {
                navigationItem.title = "Đăng nhập";
            }
            
        } else if item === optionVC?.tabBarItem{
            navigationItem.title = "Thêm";
        }
    }
}
