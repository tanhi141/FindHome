
import Foundation

struct Messages {
    static let NOTIFI_TITLE = "Thông Báo";
    static let ERROR_TITLE = "Lỗi";
    static let ERROR_CONNECT =  "Vui lòng kiểm tra lại kết nối.";
    
    struct PhoneNumber{
        static let ERROR_VALIDATE = "Chưa nhập hoặc số điện thoại không hợp lệ.\nVui lòng kiểm tra lại thông tin.";
        static let ERROR_REQUIRED = "Vui lòng nhập số điện thoại.";
    }
    
    struct Login{
        static let ERROR_INVALID_EMAIL = "Địa chỉ email chưa đúng."; //Code = 17008
        static let ERROR_USER_NOT_FOUND = "Địa chỉ email không tồn tại. " //Code = 17011
        static let ERROR_WRONG_PASSWORD =  "Mật khẩu chưa đúng."; // Code = 17009
        static let ERROR_REQUIRED =  "Vui lòng điền đầy đủ thông tin.";
        

    }
    
    struct Option {
        static let ERROR_SIGNOUT_FAILED = "Đăng xuất thất bại!";
    }
    
    struct Register{
        static let ERROR_INVALID_EMAIL = "Địa chỉ email chưa đúng."; //Code = 17008
        static let ERROR_WRONG_PASSWORD =  "Mật khẩu và mật khẩu xác thực không trùng khớp.";
        static let ERROR_WRONG_PHONE_NUMBER =  "Số điện thoại không hợp lệ.";
        static let ERROR_REQUIRED =  "Vui lòng điền đầy đủ thông tin.";
        static let ERROR_FAILED =  "Đăng ký thất bại. Vui lòng thử lại sau.";
        static let SUCCESS =  "Đăng ký thành công.";
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
    
    struct Option {
        static let ACCOUNT_BUTTON = "Tài khoản";
        static let EDIT_INFO_BUTTON = "Chỉnh sửa thông tin";
        static let EDIT_PASSWORD_BUTTON = "Đổi mật khẩu";
        static let SUPPORT_BUTTON = "Hỗ trợ";
        static let SETTING_BUTTON = "Cài đặt";
        static let SIGNOUT_BUTTON = "Đăng xuất";
        static let SIGNUP_BUTTON = "Đăng xuất";
    }
    
}

struct Keys{
    struct Login {
        static let EMAIL = "email";
        static let PASSWORD = "password";
    }
}

