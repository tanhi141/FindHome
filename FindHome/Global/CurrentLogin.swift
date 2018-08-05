

import Foundation

struct CurrentLogin {
    static var email = "";
    static var password = ""
    
}

extension CurrentLogin{
    static let shared = CurrentLogin()
}

var defaults = UserDefaults.standard
