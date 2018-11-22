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
   
    let KEY_ALL_POST = "Post";
    let KEY_TITLE = "title";
    let KEY_AREA = "area";
    let KEY_PRICE = "price";
    let KEY_ADDRESS = "address";
    let KEY_TYPE = "type";
    let KEY_CITY = "city";
    let KEY_DISTRICT = "district";
    let KEY_MORE_ADDRESS = "more";
    let KEY_ID = "idPost";
    let KEY_DATE = "date";
    let KEY_MORE = "more";
    
    
//    private let databaseRef: DatabaseReference;
    static let shared = FBAccountManager();

    typealias LoginCallback = (Error?) -> Void;
    typealias InfoAccountCallback = (User) -> Void;
    typealias SuccessCallback = (Error?) -> Void;
    typealias SampleCallback = (Bool?) -> Void;
    typealias PostCallback = (Bool, [DetailPost]) -> Void;
    var uid: String = ""
    
    
    init() {
        
    }
}


//MARK: - Login
extension FBAccountManager{
    
    func login(account: UserAccount, callback: @escaping LoginCallback){
        Auth.auth().signIn(withEmail: account.email ?? "", password: account.password ?? "") { (result, error) in
            
            if error == nil {
                let uid = result?.user.uid ?? "";
                self.fetchUserProfile(idUser: uid, callback: nil);
                InfoMore.shared.idUser = uid;
            }
            
            callback(error);
        }
        Auth.auth().signIn(withEmail: account.email ?? "",
                           password: account.password ?? "") {(result, error) in
                            
                            
                            callback(error)
        }
    }
    
    func fetchUserProfile(idUser: String, callback: SampleCallback?){
        func handleUserProfile(snapshot: DataSnapshot){
            guard  let data = snapshot.value as? [String: Any?] else {
                callback?(false);
                return
            }
            
            print("data\(data)");
            User.currentUserLogin.email = data[KEY_EMAIL] as? String;
            User.currentUserLogin.fullName = data[KEY_FULLNAME] as? String;
            User.currentUserLogin.phonenNumber = data[KEY_PHONENUMBER] as? String;
            User.uid = idUser;
            callback?(true)
            
        }
        
        userRef()?.child(idUser).observe(.value, with: handleUserProfile)
        
    }
}

//MARK: Reference
extension FBAccountManager{
    
    func userRef() -> DatabaseReference?{
        return Database.database().reference().child(KEY_USER);
    }
    
    func postRef() -> DatabaseReference?{
        return Database.database().reference().child(KEY_ALL_POST);
    }
}

//MARK: Register
extension FBAccountManager{
    
//    10. Xử lý chi tiết
//    10.(2) Xử lý đăng ký
//    10.(2).3. Dùng firebase để đăng kí tài khoản

    func register(user: User, password: String, callback:  @escaping SuccessCallback){
        
        //10.(2).3.a
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

//MARK: POST
extension FBAccountManager{

    func fetchAllPost(callback: @escaping PostCallback){
        
        
        func handleDataPost(snapshot: DataSnapshot){
            print(snapshot);
            guard  let data = snapshot.value as? [String: [String: Any]] else {
                callback(false, []);
                return
            }
            
            var listPost = [DetailPost]()
            
            for item in data{
                let post = DetailPost();
                
                post.title = item.value[KEY_TITLE] as? String;
                post.address = item.value[KEY_ADDRESS] as? String;
                post.area = item.value[KEY_AREA] as? String;
                post.more = item.value[KEY_MORE] as? String;
                post.price = item.value[KEY_PRICE] as? Int;
                
                listPost.append(post);
            }
            callback(true, listPost);
        }
        postRef()?.removeAllObservers()
        postRef()?.observe(.value, with: handleDataPost);
        
    }
}
