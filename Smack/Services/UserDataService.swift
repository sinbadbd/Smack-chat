//
//  UserDataService.swift
//  Smack
//
//  Created by imran on 11/18/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation
class UserDataService {
    
    static let instance  = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor =  ""
    public private(set) var avatarName =  ""
    public private(set) var email =  ""
    public private(set) var name =  ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    func setAvatarName(avatarName: String )  {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor{
        //"[0.988235294117647, 0.713725490196078, 0.345098039215686]"
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        scanner.scanCharacters(from: comma, into: &r)
        scanner.scanCharacters(from: comma, into: &g)
        scanner.scanCharacters(from: comma, into: &b)
        scanner.scanCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        
        let newUIcolor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        return newUIcolor
    }
    
    
    // logout user
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.UserEmail = ""
        AuthService.instance.authToken = ""
    }
    
    
}
