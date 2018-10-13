
import Foundation

struct Messages {
    static let NOTIFI_TITLE = "Thông Báo";
    static let ERROR_TITLE = "Lỗi";

    struct PhoneNumber{
        static let ERROR_VALIDATE = "Chưa nhập hoặc số điện thoại không hợp lệ.\nVui lòng kiểm tra lại thông tin.";
        static let ERROR_REQUIRED = "Vui lòng nhập số điện thoại.";
    }
    
    struct Login{
        static let ERROR_VALIDATE = "Email hoặc password không đúng. Vui lòng kiểm tra lại.";
        static let ERROE_REQUIRED =  "Vui lòng điền đầy đủ thông tin.";
        static let ERROR_CONNECT =  "Vui lòng kiểm tra lại kết nối.";
        
    }
}

struct Title{
    static let ALL_POST_TITLE = "Tất cả";
    static let HISTORY_TITLE = "Lịch sử";
    static let SIGN_TITLE = "Đăng nhập";
    static let SIGNUP_TITLE = "Đăng kí";
    static let SIGNOUT_TITLE = "Đăng xuất";
    static let ACCOUNT_TITLE = "Tài khoản";
    static let MORE_TITLE = "Khác";
//    static let backTitle = "Quay lại";
    
}

struct Keys{
    struct Login {
        static let EMAIL = "email";
        static let PASSWORD = "password";
    }
}
