
import Foundation

struct Messages {
    static let notificationString = "Thông Báo";

    struct PhoneNumber{
        static let errorTitle = "Báo lỗi";
        static let errorMessage = "Chưa nhập hoặc số điện thoại không hợp lệ.\nVui lòng kiểm tra lại thông tin.";
    }
    
    struct Login{
        static let errorValidate = "Email hoặc password không đúng. Vui lòng kiểm tra lại.";
        static let errorRequired =  "Vui lòng điền đầy đủ thông tin.";
    }
}

struct Title{
    static let allPostTitle = "Tất cả";
    static let historyTitle = "Lịch sử";
    static let loginTitle = "Đăng nhập";
    static let accountTitle = "Tài khoản";
    static let moreTitle = "Thêm";
    static let backTitle = "Quay lại";
    
}

struct Keys{
    struct Login {
        static let email = "email";
        static let password = "password";
    }
}
