

import Foundation
class UserAccount{
    var email: String?
    var password: String?;
    
    init(email: String?, password: String?){
        self.email = email;
        self.password = password;
        
    }
}

extension UserAccount{
    static var shared = UserAccount(email: "", password: "");
}
