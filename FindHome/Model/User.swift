

import Foundation

struct User{
    var email: String?
    var fullName: String?
    var phonenNumber: String?
    
    init() {
        email = ""
        fullName = ""
        phonenNumber = ""
    }
    
    init?(firebase data: [String: Any], forKey uid: String) {
        self.email = data["email"] as? String;
        self.fullName = data["fullName"] as? String;
        self.phonenNumber = data["phoneNumber"] as? String;
    }

    static var shared = User();
    static var currentUserLogin = User();
    static var uid: String = "";
}

    var idUser: String = "";
