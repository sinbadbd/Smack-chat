//
//  AuthService.swift
//  Smack
//
//  Created by imran on 11/14/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard // save data local - Mobile. But is't not secure. But we can add any kind of data
    
    // User Login
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    //User Auth
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    // User Email
    var UserEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email : String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
       

        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseString { (response) in
            if response.result.error == nil {
                completion(true)
                print("\(URL_REGISTER)")
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func login(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        

        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let email = json["user"] as? String {
                        self.UserEmail = email
                        print("user email \(self.UserEmail)")
                    }
                    
                    if let token = json["token"] as? String {
                        self.authToken = token
                        print("token... \(self.authToken)")
                    }
                }
                print("\(URL_LOGIN)")
                self.isLoggedIn = true
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    // Create User
    func createUser(name: String, email: String, avatarName:String, avatarColor: String, completion: @escaping CompletionHandler){
        let email = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": email,
            "avatarName": avatarName,
            "avatarColor":avatarColor
        ]
        
       
        
        Alamofire.request(URL_CREATE_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    
    //login by user emailAnyfunc finUserByEmai
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        
//        let BEARE_HEADERs = [
//            "Authorization"  : "Bearer \(AuthService.instance.authToken)",
//            "Content-Type" : "application/json"
//        ]
        
       // print("log....................")
//        Alamofire.request("\(URL_USER_BY_EMAIL)\(UserEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARE_HEADER).responseJSON { (response) in
//            print("log....................1111")
//            if response.result.error == nil {
//                guard let data = response.data else {return}
//                self.setUserInfo(data: data)
//                completion(true)
//                 print("Success: \(response.result.isSuccess)")
//                print("logged in user\(data)")
//            }else {
//                completion(false)
//                debugPrint(response.result.error as Any)
//            }
//        }
        
//        Alamofire.request("\(URL_USER_BY_EMAIL)\(UserEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
//            if response.result.error == nil {
//                guard let data = response.data else {return}
//                self.setUserInfo(data: data)
//                completion(true)
//            } else {
//                completion(false)
//                debugPrint(response.result.error as Any)
//            }
//        }
        
        Alamofire.request("\(URL_USER_BY_EMAIL)\(UserEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseString  { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data : Data){
        let json = try! JSON(data: data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
    }
    
}




