//
//  ViewController.swift
//  Be App
//
//  Created by Taylor Smith on 8/24/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LogInVC: UIViewController {

// Connections
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var passwordIcon: UIImageView!
    
    var userID: String!
    
    
// Variables
    
    var database: Firestore!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
  
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateLoading()
    }

    
    @IBAction func logInButton(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, email.count > 0, password.count > 0 else {
            print("enter an email and password please")
            
            return}
        
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            
            if let error = error, user == nil {
                let alert = UIAlertController(title: "Sign In Failed",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            self.userID = user?.user.uid
            self.performSegue(withIdentifier: "mainViewSegue", sender: nil)
            print("You are logged in as \(email)")
           
            
 
            
            
        }
        
    }
    
 
    
    
    func animateLoading() {
        
        logoLabel.alpha = 0
        self.emailIcon.alpha = 0
        self.emailLine.alpha = 0
        self.passwordLine.alpha = 0
        self.passwordIcon.alpha = 0
        logInButtonOutlet.alpha = 0
      
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/4.0, animations: {
                self.logoLabel.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.66/2.0, relativeDuration: 1.0/4.0, animations: {
                self.emailIcon.alpha = 1
                self.emailLine.alpha = 1
                self.passwordLine.alpha = 1
                self.passwordIcon.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1.33/2.0, relativeDuration: 1.0/4.0, animations: {
               self.logInButtonOutlet.alpha = 1
            })
            
            
        }, completion: { _ in
            
            print("i'm done!")
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
       // let vc = segue.destination as? SignUpVC2
       // vc?.email = email
       // vc?.password = password
        
    }
    


}

