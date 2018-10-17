
import Foundation
import UIKit
class DetailPost {
    var idPost: String?
    var phoneNumber: String?
    var type: Type?
    var address: Address?
    var area: String?
    var price: Int?
    var idUser: String?
    var more: String?
    var title: String?
    var image: [UIImage]?

    init() {
        self.phoneNumber = "";
        self.type = Type.Unknow;
        self.address = Address()
        self.area = ""
        self.price = 0;
        self.more = ""
        self.title = ""
        self.image = []
        self.idUser = ""
    }
}

extension DetailPost{
    static var shared = DetailPost()
}
