//
//  Constants.swift
//  Smack
//
//  Created by imran on 11/11/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//url

let BASE_URL = "https://smartsmackchat.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"



let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWINE = "unwineToChannel"



//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "LOGGED_IN_KEY"
let USER_EMAIL = "userEmail"
