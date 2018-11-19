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
    let KEY_USER = "User";
    let KEY_FULLNAME = "fullName";
    let KEY_PHONENUMBER = "phoneNumber";
    let KEY_EMAIL = "email";
    
    
//    private let databaseRef: DatabaseReference;
    static let shared = FBAccountManager();

    typealias LoginCallback = (Error?) -> Void;
    typealias InfoAccountCallback = (User) -> Void;
    typealias SuccessCallback = (Error?) -> Void;
    
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
    
//    func signUp(user: User, password: String, callback: @escaping SuccessCallback){
//        Auth.auth().createUser(withEmail: user.email ?? "", password: password) { (user, error) in
//            if error == nil {
//                self.userRef()?.setValue(user);
//
//            } else {
//
//            }
//        }
//    }
    
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

//MARK: Reference
extension FBAccountManager{
    
    func userRef() -> DatabaseReference?{
        return Database.database().reference().child(KEY_USER);
    }
}

//MARK: Register
extension FBAccountManager{
    
    func register(user: User, password: String, callback:  @escaping SuccessCallback){
        Auth.auth().createUser(withEmail: user.email ?? "", password: password) { (result, error) in
            if error == nil,let account = result?.user{
                self.addUserProfile(id: account.uid, user: user);
            }
            
            callback(error);
        }
    }
    
    func addUserProfile(id: String,user: User){
        
        let userProfile = [KEY_EMAIL: user.email ?? "",
                           KEY_FULLNAME: user.fullName ?? "",
                           KEY_PHONENUMBER: user.phonenNumber ?? ""];
        
        userRef()?.child(id).setValue(userProfile);
    }
}
