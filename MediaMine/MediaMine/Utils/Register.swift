//
//  Register.swift
//  MediaMine
//
//  Created by Amy Stockinger on 7/14/19.
//  Copyright © 2019 OSU-CS467. All rights reserved.
//

import Foundation
import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var RegUsername: UITextField!
    @IBOutlet weak var RegEmail: UITextField!
    @IBOutlet weak var RegPassword: UITextField!
    @IBOutlet weak var RegPassword2: UITextField!
    @IBOutlet weak var AgreeTerms: UISwitch!
    var agreed = false;
    
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    
    @IBAction func checkTerms(_ sender: UISwitch) {
        if(sender.isOn == true){
            agreed = true;
        }
        else{
            agreed = false;
        }
    }
    
    @IBAction func RegisterUser(_ sender: UIButton) {
        let userEmail = RegEmail?.text;
        let userName = RegUsername?.text;
        let userPassword = RegPassword?.text;
        let verifyPassword = RegPassword2?.text;
            
        // check fields
        if((userName?.isEmpty)! || (userPassword?.isEmpty)! || (userEmail?.isEmpty)!){
            // display alert message
            displayAlert(userMessage: "All fields are required");
            return;
        }
        
        // check passwords, they must match
        if(userPassword != verifyPassword){
            // display alert message
            displayAlert(userMessage: "Passwords do not match");
            return;
        }
        
        let valid = Validation()
        
        let validEmail = valid.validate(values: (type: ValidationType.email, inputValue: userEmail!));
        switch validEmail{
        case .success:
            break
        case .failure(_, let message):
            displayAlert(userMessage: message.rawValue)
            return;
        }
        
        let validPassword = valid.validate(values: (type: ValidationType.password, inputValue: userPassword!));
        switch validPassword{
        case .success:
            break
        case .failure(_, let message):
            displayAlert(userMessage: message.rawValue)
            return;
        }
        
        // check term agreement
        if(AgreeTerms != nil){
            checkTerms(AgreeTerms);
        }
        if(agreed == false){
            displayAlert(userMessage: "Please read the Terms and Conditions");
            return;
        }
        
        // store data serverside
        /*
         TODO: check that email and username do not already exist
        */
        
        // confirmation message
        let myAlert = UIAlertController(title: "Alert", message: "Registration Successful!", preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            action in self.dismiss(animated: true, completion:nil);
        }
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
 
    func displayAlert(userMessage:String){
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion: nil);
    }
}
