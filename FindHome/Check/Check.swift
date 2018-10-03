
import Foundation

struct Check {
    var isLogin = false;
    var isEdit = false;
    init() {
        isLogin = false
        
    }
}

extension Check {
    static var checkAll = Check()
}
