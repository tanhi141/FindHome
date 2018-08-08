//import Firebase
//import FirebaseAuth
//import FirebaseStorage
//
//import Foundation
//
////class Dtatabase(){
////    let listPost: [DetailPost]? = []
////
////    init(){
////        listPost =
////    }
////}
//
//struct Firebase{
//
//    public static var postList: [DetailPost]? = [];
//
//    static func fetchAllPost() -> [DetailPost]{
//
//        let ref = Database.database().reference().child("Post")
////        var snap = DataSnapshot()
//
//
//        ref.observeSingleEvent(of: .value, with: { snapshot in
//
//            if !snapshot.exists() {
//                return;
//            }
//
//            postList = fetchAll(snapshot: snapshot);
//
//            return;
//        })
//
//        return postList ?? []
//    }
//
//    
//
//    func fetchAll(snapshot : DataSnapshot?) -> [DetailPost]{
//
//        guard let snapshot = snapshot else {
//            return []
//        }
//        var list : [DetailPost]? = []
//        let postList = snapshot.value as! [String: Any]
//
//        for var post in postList{
//
//            let value = post.value as? [String: String];
//            let p = DetailPost()
//
//            p.title = value?["title"] ?? "";
//            p.address?.city = value?["address"] ?? "";
//            p.area = value?["area"] ?? "";
//            p.idPost = value?["idPost"] ?? "";
//            p.idUser = value?["idUser"] ?? "";
//            p.more = value?["more"] ?? "";
//            p.phoneNumber = value?["phoneNumber"] ?? "";
//            p.price = value?["price"] ?? "";
//
//            list?.append(p)
//        }
//
//        return list ?? []
//    }
//
//}
//
