//
//  LoginVC.swift
//  Smack
//
//  Created by imran on 11/11/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createAccountBtnPressed(_ sender: Any) {
            performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
