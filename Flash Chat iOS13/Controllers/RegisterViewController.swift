//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorAuth: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorAuth.text = ""
       
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        //register with firebase and return result 
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                self.errorAuth.text = e.localizedDescription
            }else{
                // Navigate to the ChatViewController
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
                
            }
        }
        }
    }
    
}
