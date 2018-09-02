//
//  SignUpVC3.swift
//  Be App
//
//  Created by Taylor Smith on 8/30/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit

class SignUpVC3: UIViewController {
    
    var email = ""
    var password = ""
    var churchName = ""
    var address = ""
    var city = ""
    var state = ""
    var zipCode = ""
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

 
    @IBAction func nextButton(_ sender: Any) {
        
        if addressTextField.text == "" || cityTextField.text == "" || stateTextField.text == "" || zipCodeTextField.text == "" {
            
            let alert = UIAlertController(title: "Enter Address", message: "Please enter where you gather", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            
        } else {
            
            performSegue(withIdentifier: "ToSignUp4", sender: nil)
            
            
        }
        
        
        
        
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as? SignUpVC4
        
        vc?.email = email
        vc?.password = password
        vc?.churchName = churchName
        vc?.address = addressTextField.text!
        vc?.city = cityTextField.text!
        vc?.state = stateTextField.text!
        vc?.zipCode = zipCodeTextField.text!
    }


}
