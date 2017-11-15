//
//  CreateAccountVC.swift
//  Smack
//
//  Created by imran on 11/11/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func CreateAccount(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != " " else {
            return
        }
        guard let pass = passTxt.text , passTxt.text != " " else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success  ) in
            if success {
                print("register User")
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
