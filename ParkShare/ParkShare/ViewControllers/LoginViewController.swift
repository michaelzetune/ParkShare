//
//  LoginViewController.swift
//  ParkShare
//
//  Created by Michael Zetune on 4/13/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.autocorrectionType = .no
        passwordField.autocorrectionType = .no
        
        // ***for testing. remove later****
        emailField.text = "test@test.com"
        passwordField.text = "test123"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if (emailField.text!.isEmpty || passwordField.text!.isEmpty) {
            let emptyFieldsAlert = UIAlertController(title: "Fields Empty", message: "One or more fields are empty. Try again", preferredStyle: .alert)
            emptyFieldsAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(emptyFieldsAlert, animated: true)
        }
        
        PFUser.logInWithUsername(inBackground: emailField.text!, password: passwordField.text!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "fromLoginToListingsSegue", sender: nil)
            } else {
                let badCredentialsAlert = UIAlertController(title: "Bad Credentials", message: "Your email or password is incorrect. Try again", preferredStyle: .alert)
                badCredentialsAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                    self.passwordField.text = ""
                }))
                self.present(badCredentialsAlert, animated: true)
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
