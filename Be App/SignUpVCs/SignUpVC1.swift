//
//  SignUpVC1.swift
//  Be App
//
//  Created by Taylor Smith on 9/19/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit

class SignUpVC1: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var email = ""
    var password = ""

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        email = emailTextField.text!
        
        
        if passwordTextField.text != confirmPasswordTextField.text {
            
            displayAlert("Passwords Do Not Match", andMessage: "Please ensure your password is correct")
        } else {
        password = confirmPasswordTextField.text!
            
            performSegue(withIdentifier: "ToSignUp2", sender: nil)
        
        }
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func displayAlert(_ title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? SignUpVC2
        
        vc?.email = email
        vc?.password = password
        
    }
}
