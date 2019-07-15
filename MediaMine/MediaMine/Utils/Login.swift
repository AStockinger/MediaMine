//
//  Login.swift
//  MediaMine
//
//  Created by Amy Stockinger on 7/14/19.
//  Copyright © 2019 OSU-CS467. All rights reserved.
//

import Foundation
import UIKit

class LoginPageViewController: UIViewController {
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    @IBOutlet weak var UsernameLogin: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    
    @IBAction func LoginUser(_ sender: UIButton){
        // make sure username and password are in database
    }
}
