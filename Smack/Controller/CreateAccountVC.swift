//
//  CreateAccountVC.swift
//  Smack
//
//  Created by imran on 11/11/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit
class CreateAccountVC: UIViewController {
    
    
    //    @IBOutlet weak var usernameTxt: UITextField!
    //    @IBOutlet weak var emailTxt: UITextField!
    //    @IBOutlet weak var passTxt: UITextField!
    
    
    
    
    @IBOutlet weak var UsernameText: UITextField!
    @IBOutlet weak var UserEmailText: UITextField!
    @IBOutlet weak var UserPasswordText: UITextField!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    
    
    
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        guard let name = UsernameText.text, UsernameText.text != "" else {return}
        guard let email = UserEmailText.text , UserEmailText.text != " " else {
            print("email")
            return
        }
        guard let pass = UserPasswordText.text , UserPasswordText.text != " " else {
            print("pass")
            return
        }
        
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
               // print("registered user!\(email) + \(pass)")
                AuthService.instance.login(email: email, password: pass, completion: { (success) in
                    if  success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            print("add user")
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWINE, sender: nil )
                            }
                        })
                    }
                })
                
            }
        }
        
    }
    @IBAction func pickAavatarPressed(_ sender: Any) {
    }
    
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    @IBAction func CLoseCreateAccount(_ sender: Any) {
        performSegue(withIdentifier: UNWINE, sender: nil)
    }
    
    
    
}
