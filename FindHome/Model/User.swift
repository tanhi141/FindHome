

import Foundation

struct User{
//    var email = ""
//    var fullName = ""
//    var phonenNumber = ""
//    var idUser = ""

    var email: String?
    var fullName: String?
    var phonenNumber: String?
    var idUser: String?
    
    init() {
        email = ""
        fullName = ""
        phonenNumber = ""
        idUser = ""
    }
    
    init?(firebase data: [String: Any], forKey uid: String) {
        self.email = data["email"] as? String;
        self.fullName = data["fullName"] as? String;
        self.phonenNumber = data["phoneNumber"] as? String;
        self.idUser = uid;
    }

    static var shared = User();
}
