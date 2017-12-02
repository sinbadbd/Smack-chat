//
//  ChannelVC.swift
//  Smack
//
//  Created by Jonny B on 7/14/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //
    
    // @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        //Notification
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func LoginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            //show profile modal page
            let profile = ProfileVCViewController()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            print("login")
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
            print("go create page")
        }
        
    }
    
    //User loggedin then notitify. And change image & user email.
    @objc func userDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIn{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor
            )
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            //userImg.backgroundColor = UIColor.clear
        }
    }
}
