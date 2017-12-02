//
//  AddchannelVC.swift
//  Smack
//
//  Created by imran on 11/30/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class AddchannelVC: UIViewController {

    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var chanDest: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBOutlet weak var CreateChannelPressed: RoundedButton!
    
    @IBAction func CreateChannel(_ sender: Any) {
        print("create channel")
        loading.isHidden = false
        loading.startAnimating()
     
        guard let channelName = nameTextField.text, nameTextField.text != "" else {return}
        guard let chanDes = chanDest.text else {return}
        
        SocketServices.instance.addChannel(channelName: channelName, channelDescription: chanDes) { (success) in
            if success {
                self.loading.isHidden = true
                self.loading.stopAnimating()
                self.dismiss(animated: true, completion: nil)                
            }
        }
    
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupView(){
        loading.isHidden = true
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddchannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlace])
        chanDest.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlace])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
