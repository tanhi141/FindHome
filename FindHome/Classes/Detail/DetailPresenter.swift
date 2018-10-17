
import Foundation
import Firebase
class DetailPresenter: DetailPresenting{

    private var view: DetailView?;
    private var type: TypePost?
    var currentPost: DetailPost?
    
    var checkPostData = false;
    var checkPostImage = false;
    var checkDowImage = false;
    
    var idImage: Int = 0;
    var urlImageList : [URL]? = []
    let imageList = [#imageLiteral(resourceName: "homeDemo"),#imageLiteral(resourceName: "IMG_0312"), #imageLiteral(resourceName: "IMG_0305"), #imageLiteral(resourceName: "IMG_0339")];

    init(view: DetailView, type: TypePost, post: DetailPost) {
        self.view = view;
        self.type = type;
        self.currentPost = post;
        self.currentPost?.image = imageList
    }
    
    func viewOnReady(){
        view?.showTitle(currentPost?.title ?? "");
        view?.showAddress(currentPost?.address ?? Address());
        view?.showArea(currentPost?.area ?? "");
        view?.showPrice(currentPost?.price ?? 0);
        view?.showType(currentPost?.type ?? .Unknow);
        view?.showPhoneNumber(currentPost?.phoneNumber ?? "");
        view?.showMore(currentPost?.more ?? "");
        
        if !(currentPost?.image?.isEmpty)!{
//            view?.showImage(currentPost?.image ?? [], idImage: idImage);
            view?.showImage(self.imageList, idImage: idImage)
        }
        
        view?.updateUI(self.type ?? .unknow)
        
    }
    func tappedButtonCall() {
        switch type! {
            
        case .read:
            makeCall(currentPost?.phoneNumber ?? "")
            break
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
            view?.showPhoneNumberVC(currentPost?.phoneNumber ?? "")
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
        view?.showImage((currentPost?.image!)!, idImage: idImage)
    }
    
    func selectNextImage() {
        if idImage == (currentPost?.image?.count)! - 1 {
            idImage = 0;
        } else {
            idImage = idImage + 1;
        }
        view?.showImage(currentPost?.image ?? [], idImage: idImage)
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
        view?.showIndication(true);
        var ref: DatabaseReference?
        ref = Database.database().reference()
        var post = ref?.child("Post").childByAutoId()
        if let idPost = currentPost?.idPost{
            post = ref?.child("Post").child(idPost)
        } else{
            post = ref?.child("Post").childByAutoId()
        }
        
        

        var dict = [String:Any]()
        
        dict.updateValue(User.shared.idUser ?? "", forKey: "idUser")
        dict.updateValue(currentPost?.title ?? "", forKey: "title")
        dict.updateValue(currentPost?.address?.city ?? "", forKey: "address")
        dict.updateValue(currentPost?.area ?? "", forKey: "area")
        dict.updateValue(currentPost?.more ?? "", forKey: "more")
        dict.updateValue(currentPost?.price ?? "", forKey: "price")
        dict.updateValue(currentPost?.phoneNumber ?? "", forKey: "phoneNumber")
        dict.updateValue(currentPost?.type?.rawValue ?? "", forKey: "type")
        dict.updateValue(post?.key ?? "", forKey: "idPost")
        
        post?.setValue(dict, withCompletionBlock: {[weak self] (error, result) in
            if error != nil {
//                self?.view?.showError(success: false)
                self?.view?.showIndication(false);
            } else {
                if DetailPost.shared.image?.isEmpty == false{
                    let list = DetailPost.shared.image ?? []
                    var i = 0;
                    for item in list {
                        self?.uploadImage(childString: post?.key ?? "", image: item, id: i);
                        i = i + 1;
                    }
                    
                }
            }
        })
        
        DetailPost.shared = DetailPost()
        view?.showIndication(false);
        view?.showHome(nil);
    }
    
    
    //Upload image
    func updaloaImages(images: [UIImage]){
        var i = 0;
        var success: Bool?
        for image in images {
            success = uploadImage(childString: DetailPost.shared.idPost ?? "", image: image, id: i);
            i = i + 1;
            if success == false {
//                view?.showError(success: false);
            }
        }
    }
    
    
    //childString = idPost
    func uploadImage(childString: String, image: UIImage, id: Int) -> Bool?{
        var urlImage: URL? = nil
        
        let str = id.description
        var susscess = false;
        let path = "\(childString)/\(str).jpeg"
        let storageRef = Storage.storage().reference(withPath: path);
        print(path)

        let data = UIImagePNGRepresentation(image)
        let uploadMetadata = StorageMetadata()

        uploadMetadata.contentType = "\(str)/jpeg"
        var existsSwitch = false
        storageRef.putData(data!, metadata: nil) { (meta, error) in

            guard let meta = meta else {
                susscess = true;
                existsSwitch = true;
                storageRef.downloadURL {[weak self] (url, error) in
                    if error != nil{
//                        self?.view?.showError(success: false);
                        return;
                    } else {
                        self?.urlImageList?.append(url!)
                    }
                }
                return
            }
            
            if !existsSwitch{
//                self.view?.showError(success: false)
            }

        }
        return susscess;
    }
}




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


