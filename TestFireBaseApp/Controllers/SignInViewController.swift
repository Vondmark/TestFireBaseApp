//
//  SignInViewController.swift
//  TestFireBaseApp
//
//  Created by Mark on 13.03.2020.
//  Copyright © 2020 Mark. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignInViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func checkValid() -> String? {
        
        if firstNameTextField.text == "" || firstNameTextField == nil ||
            lastNameTextField.text == "" || lastNameTextField == nil ||
            emailTextField.text == "" || emailTextField == nil ||
            passwordTextField.text == "" || passwordTextField == nil {
            return "Please fill in all fiels"
        }
        return nil
    }

    @IBAction func signInButton(_ sender: Any) {
        let error = checkValid()
        if error != nil {
            errorLabel.isHidden = false
            errorLabel.text = error
        } else {
            errorLabel.isHidden = true
            Auth.auth().createUser(withEmail:  emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil {
                    self.errorLabel.text = "\(error?.localizedDescription)"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "firstName" : self.firstNameTextField.text!,
                        "lastName" : self.lastNameTextField.text!,
                        "uid" : result!.user.uid
                    ]) { (error) in
                        
                        if error != nil {
                            self.errorLabel.text = "Error"
                        }
                        print(result!.user.uid)
                    }
                }
                print("Jump tp nx scr")
            }
        }
    }
}
