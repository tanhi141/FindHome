
import UIKit
import FirebaseCore
import FirebaseStorage

class HomeVC: UITabBarController {

    var allPostVC: UIViewController?
    var myPostVC: UIViewController?
    var postVC: UIViewController?
    var optionVC: UIViewController?

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Trang chủ"
//        navigationController?.setNavigationTitle(title: "Trang chủ", isHide: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUp()
        addTabBar()
        
//        updaloaImage(image: #imageLiteral(resourceName: "navi"))
        
        
    }
    
    func updaloaImage(image: UIImage){
        
//        let storageRef = Storage.storage().reference(withPath: "images/image.png")
//        let data = UIImagePNGRepresentation(image)
//        let uploadMetadata = StorageMetadata()
//        uploadMetadata.contentType = "images/jpeg"
//        let uploadTask = storageRef.putData(data!, metadata: uploadMetadata) { (metadata, error) in
//            if error != nil{
//
//            } else {
//
//            }
//        }
        
//        storageRef.putData(data!, metadata: nil) { (meta, error) in
//            guard let meta = meta else {
//
//
//                return
//            }
        
//            storageRef.downloadURL { (url, error) in
//                guard let downloadURL = url else {
//                    return
//                }
//            }
//        }

    }
    
    
    func setUp(){
        
        allPostVC = AllPostVC()
//        allPostVC = ReviewVC()
        
        myPostVC = ReviewVC()
        
        let vcOption = OptionVC()
        vcOption.presenter = OptionPresenter(view: vcOption, user: nil)
        optionVC = vcOption
        
        
        if Check.checkAll.isLogin == true{
            let vc = PhoneNumberVC()
            vc.presenter = PhoneNumberPresenter(view: vc, phoneNumber: DetailPost.shared.phoneNumber ?? User.share.phonenNumber ?? "");
            postVC = vc;
            
        } else {
            let vc = Login()
            var account = UserAccount()
            
            account.email = defaults.string(forKey: "email")
            account.password = defaults.string(forKey: "password")
            vc.presenter = LoginPresenter(view: vc, userAccount: account);
            
            postVC = vc;
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
            
        } else if item === myPostVC?.tabBarItem{
            navigationItem.title = "Của tôi";
//            navigationController?.setNavigationTitle(title: "Của tôi", isHide: false)
        } else if item === postVC?.tabBarItem{
            
            if Check.checkAll.isLogin == true{
                navigationItem.title = "Số điện thoại"
//                navigationController?.setNavigationTitle(title: "Số điện thoại", isHide: false)
            } else {
                navigationItem.title = "Đăng nhập"
//                navigationController?.setNavigationTitle(title: "Đăng nhập", isHide: false)
            }
            
        } else if item === optionVC?.tabBarItem{
            navigationItem.title = "Thêm"
//            navigationController?.setNavigationTitle(title: "Thêm", isHide: false)
        }
    }
}
