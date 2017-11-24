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
    @IBOutlet weak var userImg: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewPlaceHolderColor();
    }
    
    
    // This function worked, when select avatar item. And set the createAccountVC.
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        spinner.isHidden = false
        spinner.stopAnimating()
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
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWINE, sender: nil )
                               NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
                
            }
        }
        
    }
    @IBAction func pickAavatarPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        // Randomly color : RGB Value
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIImageView.animate(withDuration: 0.5){
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func CLoseCreateAccount(_ sender: Any) {
        performSegue(withIdentifier: UNWINE, sender: nil)
    }
    
    
    // set
    func setupViewPlaceHolderColor(){
        spinner.isHidden = true
        UsernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlace])
        UserEmailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlace])
        UserPasswordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlace])
        
        //Handle keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.hangleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func hangleTap(){
        view.endEditing(true)
    }
}
