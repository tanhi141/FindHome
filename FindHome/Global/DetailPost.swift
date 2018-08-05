
import Foundation
import UIKit
class DetailPost {
    var idPost: String?
    var phoneNumber: String?
    var type: Type?
    var address: Address?
    var area: String?
    var price: String?
    var idUser: String?
    var more: String?
    var title: String?
    var image: [UIImage]?

    init() {
        self.phoneNumber = "";
        self.type = Type.Unknow;
        self.address = Address()
        self.area = ""
        self.price = ""
        self.more = ""
        self.title = ""
        self.image = []
        self.idUser = User.share.idUser
    }
}

extension DetailPost{
    static let shared = DetailPost()
}
