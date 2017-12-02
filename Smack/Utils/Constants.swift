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

let BASE_URL = "https://smartsmackchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_CREATE_ADD = "\(BASE_URL)user/add"

//segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWINE = "unwineToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//Colors
 let smackPurplePlace =  #colorLiteral(red: 0.002043104607, green: 0.5401836806, blue: 0.9851879759, alpha: 0.5)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "LOGGED_IN_KEY"
let USER_EMAIL = "userEmail"

// Header
let HEADERS = [
    "Content-Type" : "application/json"
]

