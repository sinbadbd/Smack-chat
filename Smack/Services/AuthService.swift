//
//  AuthService.swift
//  Smack
//
//  Created by imran on 11/14/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation
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
}




