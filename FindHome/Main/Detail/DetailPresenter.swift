
import Foundation
import Firebase
class DetailPresenter: DetailPresenting{

    private var view: DetailView?;
    private var type: TypePost?
    let currentPost = DetailPost.shared
    
    var idImage: Int = 0;
    
    init(view: DetailView, type: TypePost) {
        self.view = view;
        self.type = type;
    }
    
    func viewOnReady(){
        
        if type == TypePost.write{
            let address = currentPost.address?.city ?? "" + (currentPost.address?.district)!
            view?.showTitle(currentPost.title ?? "")
            
            view?.showAddress("Địa chỉ: " + address);
            view?.showArea("Diện tích: " + (currentPost.area ?? ""));
            view?.showMore("Mô tả: \n" + (currentPost.more ?? ""));
            view?.showPrice("Giá: " + (currentPost.price ?? "") + "\\ tháng");
            view?.showPhoneNumber("Số điện thoại: " + (currentPost.phoneNumber ?? ""));
            view?.showType(currentPost.type!);
            
            if !(currentPost.image?.isEmpty)!{
                view?.showImage(currentPost.image!, idImage: idImage)
            }
        } else{
            
        }
        
        view?.updateUI(self.type!)
        
    }
    func tappedButtonCall() {
        switch type! {
            
        case .read:
            currentPost.phoneNumber?.makeAColl()
            break
        case .write:
            postData(post: currentPost);
            break
        }
    }
    
    func tappedButtonMessenger() {
        
    }
    
    func selectBackImage() {
        if idImage == 0 {
            idImage = (currentPost.image?.count)! - 1;
        } else {
            idImage = idImage - 1;
        }
        view?.showImage(currentPost.image!, idImage: idImage)
    }
    
    func selectNextImage() {
        if idImage == (currentPost.image?.count)! - 1 {
            idImage = 0;
        } else {
            idImage = idImage + 1;
        }
        view?.showImage(currentPost.image!, idImage: idImage)
    }
}

extension DetailPresenter{
    func postData(post: DetailPost){
        
        var ref: DatabaseReference?
        ref = Database.database().reference()
        
        
        
        var dict = [String:Any]()
        
        dict.updateValue(currentPost.idUser ?? "", forKey: "idUser")
        dict.updateValue(currentPost.title ?? "", forKey: "title")
        dict.updateValue(currentPost.address?.city ?? "", forKey: "address")
        dict.updateValue(currentPost.area ?? "", forKey: "area")
        dict.updateValue(currentPost.more ?? "", forKey: "more")
        dict.updateValue(currentPost.price ?? "", forKey: "price")
        dict.updateValue(currentPost.phoneNumber ?? "", forKey: "phoneNumber")
        dict.updateValue(currentPost.type?.rawValue ?? "", forKey: "type")
//        dict.updateValue(currentPost.phoneNumber ?? "", forKey: "phoneNumber")
        
        let idUser = ref?.child("Post").childByAutoId()
        idUser?.setValue(dict, withCompletionBlock: { (error, result) in
//            guard error.
        })
        view?.showHome(nil);
    }
}







