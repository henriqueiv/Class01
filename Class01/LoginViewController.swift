//
//  LoginViewController.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import SVProgressHUD
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowTrainer" {
            let viewController = segue.destinationViewController as! TrainerViewController
            viewController.trainer = sender as! Trainer
        }
    }
    
    // MARK: IBActions
    @IBAction func loginBtnTapped(sender: AnyObject) {
        login()
    }
    
    // MARK: Private helpers
    private func login(){
        guard let username = usernameTextField.text else {
            usernameTextField.becomeFirstResponder()
            return
        }
        
        guard let password = passwordTextField.text else {
            passwordTextField.becomeFirstResponder()
            return
        }
        
        APIManager.sharedInstance.login(username, password: password) { [unowned self] (success:Bool, errorMessage:String, trainer:Trainer?) in
            if success {
                self.performSegueWithIdentifier("ShowTrainer", sender: trainer)
            } else {
                SVProgressHUD.showErrorWithStatus(errorMessage)
            }
        }
    }

}
