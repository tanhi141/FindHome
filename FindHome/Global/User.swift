

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

    static var share = User();
}
