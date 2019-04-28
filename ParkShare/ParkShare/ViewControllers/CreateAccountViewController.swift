//
//  CreateAccountViewController.swift
//  ParkShare
//
//  Created by Michael Zetune on 4/13/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit
import Parse

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameField.autocorrectionType = .no
        emailField.autocorrectionType = .no
        passwordField.autocorrectionType = .no
        confirmPasswordField.autocorrectionType = .no

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        
        if (fullNameField.text!.isEmpty || emailField.text!.isEmpty ||
            passwordField.text!.isEmpty || confirmPasswordField.text!.isEmpty) {
            let emptyFieldsAlert = UIAlertController(title: "Fields Empty", message: "One or more fields are empty. Try again", preferredStyle: .alert)
            emptyFieldsAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(emptyFieldsAlert, animated: true)
        }
        
        else if (passwordField.text != confirmPasswordField.text) {
            let badPasswordAlert = UIAlertController(title: "Bad Password", message: "Password fields do not match. Try again", preferredStyle: .alert)
            badPasswordAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(badPasswordAlert, animated: true)
            passwordField.text = ""
            confirmPasswordField.text = ""
            
        } else {
            let user = PFUser()
            user.username = emailField.text
            user.password = passwordField.text
            user.email = emailField.text
            user["name"] = fullNameField.text
            
            user.signUpInBackground  { (success, error) in
                if success {
                    let accountCreationSuccessAlert = UIAlertController(title: "Account Created", message: "Your account for \(self.fullNameField.text ?? "") with email \(self.emailField.text ?? "") was created successfully!", preferredStyle: .alert)
                    accountCreationSuccessAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in 
                        self.performSegue(withIdentifier: "fromCreateAccountToListingsSegue", sender: nil)
                    }))
                    self.present(accountCreationSuccessAlert, animated: true)
                    
                } else {
                    print("Error:\(error?.localizedDescription)")
                }
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
