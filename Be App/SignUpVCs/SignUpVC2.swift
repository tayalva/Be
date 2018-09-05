//
//  SignUpVC2.swift
//  Be App
//
//  Created by Taylor Smith on 8/30/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit

class SignUpVC2: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    var email = ""
    var password = ""
    var churchName = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

    
      
    }

    
   
    @IBAction func nextButton(_ sender: Any) {
        
        if nameTextField.text == "" {
            let alert = UIAlertController(title: "Enter Church Name", message: "Please enter the name of your church.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        } else {
            churchName = nameTextField.text!
        performSegue(withIdentifier: "ToSignUp3", sender: nil)
        }
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as? SignUpVC3
        
        vc?.email = email
        vc?.password = password
        vc?.churchName = churchName
    }
 

}
