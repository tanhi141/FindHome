
import Foundation
import UIKit
class DetailPost {
    var idPost: String?;
    var phoneNumber: String?;
    var type: Type?;
    var address: String?;
    var area: String?;
    var price: Int?;
    var idUser: String?;
    var more: String?;
    var title: String?;
    var image: [UIImage]?;
    var date: Date?;

    init() {
        self.phoneNumber = "";
        self.type = Type.Unknow;
        self.address = "";
        self.area = "";
        self.price = 0;
        self.more = "";
        self.title = "";
        self.image = [];
        self.idUser = "";
        self.date = Date();
    }
    
    func getStringPhoneNumber() -> String{
        return "Số điện thoại: " + (self.phoneNumber ?? "Không có");
    }
    
    func getStringType() -> String{
        return "Loại: " + (self.type?.rawValue ?? "Khác");
    }
    
    func getStringAddress() -> String{
        return "Địa chỉ: " + (self.address ?? "Không có");
    }
    
    func getStringArea() -> String{
        return "Diện tích: " + (self.area ?? "0") + "m2";
    }
    
    func getStringPrice() -> String{
        return "Giá: " + formatPrice(price: self.price ?? 0);
    }
}

extension DetailPost{
    static var shared = DetailPost()
    
    func formatPrice(price: Int) -> String{
        
        let formater = NumberFormatter();
        formater.numberStyle = .decimal;
        formater.groupingSeparator = " "
        
        return formater.string(from: NSNumber(integerLiteral: price)) ?? "";

    }
}
