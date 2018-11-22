
import Foundation

struct Messages {
    static let NOTIFI_TITLE = "Thông Báo";
    static let ERROR_TITLE = "Lỗi";
    static let ERROR_CONNECT =  "Vui lòng kiểm tra lại kết nối.";
    
    struct PhoneNumber{
        static let ERROR_VALIDATE = "Chưa nhập hoặc số điện thoại không hợp lệ.\nVui lòng kiểm tra lại thông tin.";
    }
    
    struct Login{
        static let ERROR_INVALID_EMAIL = "Địa chỉ email chưa đúng."; //Code = 17008
        static let ERROR_USER_NOT_FOUND = "Địa chỉ email không tồn tại. " //Code = 17011
        static let ERROR_WRONG_PASSWORD =  "Mật khẩu chưa đúng."; // Code = 17009
        static let ERROR_REQUIRED =  "Vui lòng điền đầy đủ thông tin.";
        

    }
    
    struct Detail{
        static let ERROR_FAILED = "Quá trình đăng thất bại. Vui lòng thử lại sau."; //Code =
        
        static let BUTTON_CALL = "Gọi điện";
        static let BUTTON_MESSAGE = "Nhắn tin";
        static let BUTTON_EDIT = "Chỉnh sửa";
        static let BUTTON_POST = "Đăng tin";
    }
    
    struct Address{
        static let ERROR_REQUIRED =  "Vui lòng điền đầy đủ Thành phố & Quận/huyện.";
        
        
    }
    
    struct Area{
        static let ERROR_REQUIRED =  "Vui lòng điền đầy đủ thông tin.";
    }
    
    struct More{
        static let ERROR_REQUIRED =  "Vui lòng điền đầy đủ thông tin.";
    }
    
    struct TypeOption{
        static let ERROR_REQUIRED =  "Vui lòng chọn loại căn hộ.";
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
    static let POST_TITLE = "Đăng bài";
    static let PHONENUMBER_TITLE = "Liên hệ";
    static let CONFIRM_TITLE = "Xem lại";
    static let DETAIL_TITLE = "Chi tiết";
    static let MORE_REVIEW_TITLE = "Mô tả";
    static let ACCOUNT_INFO = "Thông tin";
    
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

