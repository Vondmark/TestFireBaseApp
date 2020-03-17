//
//  LogInViewController.swift
//  TestFireBaseApp
//
//  Created by Mark on 13.03.2020.
//  Copyright © 2020 Mark. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func checkValid() -> String? {
        
        if emailTextField.text == "" || emailTextField == nil ||
            passwordTextField.text == "" || passwordTextField == nil ||
            emailTextField.text == "" || emailTextField == nil ||
            passwordTextField.text == "" || passwordTextField == nil {
            return "Please fill in all fiels"
        }
        return nil
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let error = checkValid()
        if error != nil {
            self.errorLabel.isHidden = false
            self.errorLabel.text = error
        } else {
            self.errorLabel.isHidden = true
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { ( result, error) in
                if error != nil{
                    //
                } else {
                    print("Jump")
                }
            }
        }
    }
}
