

import Foundation
class UserAccount{
    var email: String?
    var password: String?;
}

extension UserAccount{
    
    static let shared = UserAccount()

}
