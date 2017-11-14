//
//  CreateAccountVC.swift
//  Smack
//
//  Created by imran on 11/11/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var closeAccPressed: UIButton!
    
    @IBAction func CLoseCreateAccount(_ sender: Any) {
        performSegue(withIdentifier: UNWINE, sender: nil)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
