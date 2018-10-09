//
//import UIKit
//import FirebaseCore
//import FirebaseStorage
//
//class HomeVC: UITabBarController {
//
//    var allPostVC: UIViewController?
//    var myPostVC: UIViewController?
//    var postVC: UIViewController?
//    var optionVC: UIViewController?
//    
//    let imgHomes = UIImage(named: "ic_homes");
//    let imgHome = UIImage(named: "ic_home");
//    let imgPost = UIImage(named: "ic_post");
//    let imgMore = UIImage(named: "ic_more");
//    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationItem.title = "Trang chủ"
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setUp()
//        addTabBar()
//    }
//    
//    func setUp(){
////        setUpAllPost()
////        setUpOption()
////        if Check.checkAll.isLogin{
////            setUpMyPost()
////            setUpPhoneNumber()
////        } else {
////            setUpLogin()
////        }
////        //hiden button back
////        self.navigationItem.title = "Trang chủ"
////        self.navigationItem.setLeftBarButton(nil, animated: false)
////        self.navigationItem.setHidesBackButton(true, animated: false)
//    }
//    
//    
//    
//}
//
//
//extension HomeVC{
//    func setUpLogin(){
////        let vc = Login()
////        let account = UserAccount()
////        account.email = defaults.string(forKey: "email")
////        account.password = defaults.string(forKey: "password")
////        vc.presenter = LoginPresenter(view: vc, userAccount: account);
////        
////        myPostVC = vc;
////        postVC = vc;
//        
//    }
//    
//    func setUpMyPost(){
//        let vc = AllPostVC();
//        vc.presenter = MyPostPresenter(view: vc);
//        myPostVC = vc;
//    }
//    
////    func setUpAllPost(){
////        let allPost = AllPostVC()
////        allPost.presenter = AllPostPresenter(view: allPost);
////        allPost.navigationItem.title = "Trang chủ";
////        allPostVC = allPost
////    }
//    
//    func setUpOption(){
//        let vc = OptionVC()
//        vc.presenter = OptionPresenter(view: vc, user: nil);
//        optionVC = vc;
//    }
//    
//    func setUpPhoneNumber(){
//        let vc = PhoneNumberVC();
//        vc.presenter = PhoneNumberPresenter(view: vc, phoneNumber: DetailPost.shared.phoneNumber ?? (User.shared.phonenNumber ?? ""));
//        postVC = vc;
//        
//    }
//}
//
//
//extension HomeVC{
//    func addTabBar(){
//        
//        allPostVC?.tabBarItem = UITabBarItem.init(title: "Trang chủ", image: imgHomes, tag: 0);
//        myPostVC?.tabBarItem = UITabBarItem.init(title: "Của Tôi", image: imgHome, tag: 1);
//        
//        postVC?.tabBarItem = UITabBarItem.init(title: "Đăng bài", image: imgPost, tag: 2);
//        optionVC?.tabBarItem = UITabBarItem.init(title: "Thêm", image: imgMore , tag: 3)
//        
//        allPostVC?.tabBarItem.image=UIImage(named: "ic_homes")?.withRenderingMode(.alwaysOriginal)
//        myPostVC?.tabBarItem.image=UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal)
//        postVC?.tabBarItem.image=UIImage(named: "ic_post")?.withRenderingMode(.alwaysOriginal)
//        optionVC?.tabBarItem.image=UIImage(named: "ic_more")?.withRenderingMode(.alwaysOriginal)
//        
//        if Check.shared.isLogin == false {
//            postVC?.tabBarItem = UITabBarItem.init(title: "Đăng nhập", image: imgPost, tag: 2);
//            postVC?.tabBarItem.image=UIImage(named: "ic_user")?.withRenderingMode(.alwaysOriginal)
//        }
//        self.viewControllers = [allPostVC, myPostVC, postVC, optionVC] as? [UIViewController];
//    }
//    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        
//        if item === allPostVC?.tabBarItem{
//            allPostVC?.navigationItem.title = "Trang chủ"
//        } else if item === myPostVC?.tabBarItem{
//            if Check.shared.isLogin == true{
//                navigationItem.title = "Của tôi"
//            } else {
//                navigationItem.title = "Đăng nhập"
//            }
//            
//        } else if item === postVC?.tabBarItem{
//
//            if Check.shared.isLogin == true{
//                navigationItem.title = "Liên hệ"
//            } else {
//                navigationItem.title = "Đăng nhập"
//            }
//
//        } else if item === optionVC?.tabBarItem{
//            navigationItem.title = "Thêm"
//        }
//    }
//}
