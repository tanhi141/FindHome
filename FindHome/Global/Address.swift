

import Foundation

class Address{
    var city: String?
    var street: String?
    var district: String?
    var ward: String?
    
    init() {
        self.city = ""
        self.street = ""
        self.district = ""
        self.ward = ""
    }
}

extension Address{
    static var shared = Address()
}
