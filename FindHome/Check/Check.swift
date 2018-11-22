
import Foundation

struct Check {
    var isLogin = false;
    var isEdit = false;
    init() {
        isLogin = false
    }
}

extension Check {
    static var shared = Check()
}

struct InfoMore {
    var idUser = "";
    init() {
        idUser = "";
    }
    
    static var shared = InfoMore();
}
