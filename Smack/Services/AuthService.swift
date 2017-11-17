//
//  AuthService.swift
//  Smack
//
//  Created by imran on 11/14/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation
import Alamofire
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
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
                print("\(URL_REGISTER)")
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
}




