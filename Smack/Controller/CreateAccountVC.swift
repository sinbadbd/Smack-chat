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
    
//    @IBAction func closeCreateAccont(_ sender: Any) {
//        
//        performSegue(withIdentifier: UNWINE, sender: nil)
//        
//        print("gi")
//    }
//    
    
    
//    @IBAction func clsPressed(_ sender: Any) {
//       performSegue(withIdentifier: UNWINE , sender: nil)
//    }
//
//    @IBAction func closePressed(_ sender: Any) {
//
//        dismiss(animated: true, completion: nil)
//    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
