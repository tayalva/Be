//
//  SignUpVC4.swift
//  Be App
//
//  Created by Taylor Smith on 9/1/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC4: UIViewController {
    
    var email = ""
    var password = ""
    var churchName = ""
    var address = ""
    var city = ""
    var state = ""
    var zipCode = ""
    
    //var database: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(email)
        print(password)
        print(churchName)
        print(address)
        print(city)
        print(state)
        print(zipCode)
        

    }
    @IBAction func createAccountButton(_ sender: Any) {

        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            let database = Firestore.firestore()
            guard let userID = user?.user.uid else {return}
            
                let ref = database.collection("user").document(userID)
            
                
                let data = [
                "email" : self.email,
                "churchName": self.churchName,
                "churchLocation" : "\(self.address), \(self.city), \(self.state) \(self.zipCode) ",
                "missionStatement" : "test mission statement",
                "Bio" : "We love Jesus"
                ]
                
                ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Docuemnt added with ID: \(ref.documentID)")
                }
                
            }
            
            
        }
        
     performSegue(withIdentifier: "unwindSignUpSegue", sender: self)
        
 
        
        
        
    }
    
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
