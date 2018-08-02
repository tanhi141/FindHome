
import Foundation

struct Check {
    var isLogin = false;
    
    init() {
        isLogin = false
        
    }
}

extension Check {
    static var checkAll = Check()
}
