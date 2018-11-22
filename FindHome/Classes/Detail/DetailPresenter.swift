
import Foundation
import Firebase
class DetailPresenter: DetailPresenting{
    
    let KEY_ALL_POST = "Post";
    let KEY_TITLE = "title";
    let KEY_AREA = "area";
    let KEY_PRICE = "price";
    let KEY_ADDRESS = "address";
    let KEY_TYPE = "type";
    let KEY_CITY = "city";
    let KEY_DISTRICT = "district";
    let KEY_MORE_ADDRESS = "more";
    let KEY_ID = "idPost";
    let KEY_DATE = "date";
    let KEY_MORE = "more";
    let KEY_PHONENUMBER = "phoneNumber";
    let KEY_ID_POST = "idPost";
    
    private var view: DetailView?;
    private var type: TypePost?
    var currentPost: DetailPost?
    
    var checkPostData = false;
    var checkPostImage = false;
    var checkDowImage = false;
    
    var idImage: Int = 0;
    var urlImageList : [URL]? = []
//    let imageList = [#imageLiteral(resourceName: "homeDemo"),#imageLiteral(resourceName: "IMG_0312"), #imageLiteral(resourceName: "IMG_0305"), #imageLiteral(resourceName: "IMG_0339")];

    init(view: DetailView, type: TypePost, post: DetailPost) {
        self.view = view;
        self.type = type;
        self.currentPost = post;
//        self.currentPost?.image = imageList
    }
    
    func viewOnReady(){
        view?.updateUI(self.type ?? .unknow)
        
    }
    func tappedButtonCall() {
        switch type! {
            
        case .read:
            makeCall(currentPost?.phoneNumber ?? "")
            break;
            
        case .write:
            postData(post: currentPost!);
            break
            
        case .unknow:
            break;
        }
    }
    
    func tappedButtonMessenger() {
        switch type! {
        case .read:
            makeCall(currentPost?.phoneNumber ?? "")
            break
        case .write:
//            view?.showPhoneNumberVC(currentPost?.phoneNumber ?? "")
            break
        case .unknow:
            break;
        }
    }
    
    func selectBackImage() {
        if idImage == 0 {
            idImage = (currentPost?.image?.count)! - 1;
        } else {
            idImage = idImage - 1;
        }
//        view?.showImage((currentPost?.image!)!, idImage: idImage)
    }
    
    func selectNextImage() {
        if idImage == (currentPost?.image?.count)! - 1 {
            idImage = 0;
        } else {
            idImage = idImage + 1;
        }
//        view?.showImage(currentPost?.image ?? [], idImage: idImage)
    }
}

extension DetailPresenter{
    func makeCall(_ phoneNumber: String){
        if let url = URL(string:"tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func postData(post: DetailPost){
        var ref: DatabaseReference?
        ref = Database.database().reference().child(KEY_ALL_POST).childByAutoId();

        let dict = setupValuePost();
    
        ref?.setValue(dict, withCompletionBlock: {[weak self] (error, result) in
            if error != nil {
                self?.view?.showError(Messages.Detail.ERROR_FAILED);
                self?.view?.showIndication(false);
            } else {
                self?.updaloaImages(images: []);
                self?.view?.showIndication(false);
            }
        })

        DetailPost.shared = DetailPost()
        view?.showIndication(false);
        view?.showHome(nil);
    }
    
    func setupValuePost() -> [String: Any]{
        var dict = [String:Any]()
        dict.updateValue(InfoMore.shared.idUser , forKey: KEY_ID)
        dict.updateValue(currentPost?.title ?? "", forKey: KEY_TITLE)
        dict.updateValue(currentPost?.address ?? "", forKey: KEY_ADDRESS)
        dict.updateValue(currentPost?.area ?? "", forKey: KEY_AREA)
        dict.updateValue(currentPost?.more ?? "", forKey: KEY_MORE)
        dict.updateValue(currentPost?.price ?? "", forKey: KEY_PRICE)
        dict.updateValue(currentPost?.phoneNumber ?? "", forKey: KEY_PHONENUMBER)
        dict.updateValue(currentPost?.type?.rawValue ?? "", forKey: KEY_TYPE)
        
        return dict;
    }
    
    
    func updaloaImages(images: [UIImage]){
        var i = 0;
        var success: Bool?
        for image in images {
            success = uploadImage(childString: DetailPost.shared.idPost ?? "", image: image, id: i);
            i = i + 1;
            if success == false {
            }
        }
    }
    
    func uploadImage(childString: String, image: UIImage, id: Int) -> Bool?{
        return true;
    }
}




