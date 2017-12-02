//
//  ChannelVC.swift
//  Smack
//
//  Created by Jonny B on 7/14/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //
    
    // @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource  = self
        
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        //Notification
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(channelsLoaded(_:)), name: NOTIF_CHANNELS_LOADED, object: nil)
        
        
        SocketServices.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
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
    // Add channel
    @IBAction func addChannel(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let addChannel = AddchannelVC()
            addChannel.modalPresentationStyle = .custom
            present(addChannel, animated: true, completion: nil)
        } else {
            ToastMessage()
        }
    }
    
    //User loggedin then notitify. And change image & user email.
    @objc func userDataDidChange(_ notif: Notification){
        setupUserInfo()
    }
    // Notify channel
    @objc func channelsLoaded(_ notif: Notification){
        tableView.reloadData()
    }
    
    
    
    func setupUserInfo(){
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
            tableView.reloadData()
        }
    }
    
    
    //
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MesageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MesageService.instance.channels.count
    }
    
    func ToastMessage(){
        let alert = UIAlertController(title: "Alert", message: "Please login or signup", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil)) 
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = MesageService.instance.channels[indexPath.row]
        MesageService.instance.selectedChannel = channel
        NotificationCenter.default.post(name: NOTIF_CHANNELS_SELECTED, object: nil)
        self.revealViewController().revealToggle(animated: true)
    }
    
    
    
}
