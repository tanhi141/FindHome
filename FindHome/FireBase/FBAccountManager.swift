//
//  FBAccountManager.swift
//  FindHome
//
//  Created by TaNhi on 10/9/18.
//  Copyright © 2018 TaNhi. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class FBAccountManager{
    static let shared = FBAccountManager();
    typealias LoginCallback = (Error?) -> Void;
    typealias InfoAccountCallback = (User) -> Void;
    
    init() {
    }
}


//MARK: - Login
extension FBAccountManager{
    func login(account: UserAccount, callback: @escaping LoginCallback){
        
        Auth.auth().signIn(withEmail: account.email ?? "",
                           password: account.password ?? "") {(_, error) in
                            callback(error)
        }
    }
    
    func getInfoAccount(email: String, callback: @escaping InfoAccountCallback){
        
//        func handleInfoAccount(dataSnapshot: DataSnapshot){
//            guard let data = dataSnapshot as? String: [String: Any] else {
//                return;
//            }
//
//
//            let user = User(firebase: data.value, forKey: "")
//        }
//
//                let ref = Database.database().reference().child("User").queryOrdered(byChild: "email").queryEqual(toValue: email)
//
//                ref.observeSingleEvent(of: .value, with: {[weak self] snapshot in
//
//
//
//                    let user = snapshot.value as! [String: Any]
//                    let infoUser = user.values.first as? [String: String]
//
//                    User.share.email = infoUser?["email"]  ?? ""
//                    User.share.fullName = infoUser?["fullName"] ?? ""
//                    User.share.phonenNumber = infoUser?["phoneNumber"] ?? ""
//                    User.share.idUser = infoUser?["idUser"] ?? ""
//
//                })
//
    }
}
