
import Foundation
import Firebase
class DetailPresenter: DetailPresenting{

    private var view: DetailView?;
    private var type: TypePost?
    var currentPost: DetailPost?
    
    var idImage: Int = 0;
    
    init(view: DetailView, type: TypePost, post: DetailPost) {
        self.view = view;
        self.type = type;
        self.currentPost = post;
    }
    
    func viewOnReady(){
        view?.showTitle(currentPost?.title ?? "")
        view?.showAddress(currentPost?.address ?? Address())
        view?.showArea(currentPost?.area ?? "")
        view?.showPrice(currentPost?.price ?? "");
        view?.showType(currentPost?.type ?? .Unknow);
        view?.showPhoneNumber(currentPost?.phoneNumber ?? "");
        view?.showMore(currentPost?.more ?? "");
        
        if !(currentPost?.image?.isEmpty)!{
            view?.showImage(currentPost?.image ?? [], idImage: idImage)
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
        
        var ref: DatabaseReference?
        ref = Database.database().reference()

        var dict = [String:Any]()
        
        dict.updateValue(currentPost?.idUser ?? "", forKey: "idUser")
        dict.updateValue(currentPost?.title ?? "", forKey: "title")
        dict.updateValue(currentPost?.address?.city ?? "", forKey: "address")
        dict.updateValue(currentPost?.area ?? "", forKey: "area")
        dict.updateValue(currentPost?.more ?? "", forKey: "more")
        dict.updateValue(currentPost?.price ?? "", forKey: "price")
        dict.updateValue(currentPost?.phoneNumber ?? "", forKey: "phoneNumber")
        dict.updateValue(currentPost?.type?.rawValue ?? "", forKey: "type")
//        dict.updateValue(currentPost.phoneNumber ?? "", forKey: "phoneNumber")
        
        let idUser = ref?.child("Post").childByAutoId()
        idUser?.setValue(dict, withCompletionBlock: { (error, result) in
            if error != nil {
                self.view?.showError(success: false)
            }
        })
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
                view?.showError(success: false);
            }
        }
    }
    
    
    //childString = idPost
    func uploadImage(childString: String, image: UIImage, id: Int) -> Bool{
        
        
        //        let storageRef = Storage.storage().reference(withPath: childString);
        //        let intString = id.description;
        //        uploadMetadata.contentType = "images\(intString)/jpeg"
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
                existsSwitch = true
                return
            }
            
            if !existsSwitch{
//                storageRef.downloadURL { (url, error) in
//                    guard let downloadURL = url else {
//                        return
//                    }
//                }
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


