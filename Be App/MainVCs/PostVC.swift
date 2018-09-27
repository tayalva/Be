//
//  PostVC.swift
//  Be App
//
//  Created by Taylor Smith on 9/12/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController {

    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var textView: UITextView!
    
    let database = Firestore.firestore()
    let user = Auth.auth().currentUser
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toolBar.removeFromSuperview()
        textView.inputAccessoryView = toolBar
        textView.becomeFirstResponder()
    }

    
    override func viewDidAppear(_ animated: Bool) {
       
       
    }

    @IBAction func postButton(_ sender: Any) {
        saveData()
        textView.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    
    func saveData() {
        let ref = database.collection("user").document((user?.uid)!).collection("posts").document()
        let data : [String: Any] = [
            "date" : Date(),
            "post" : textView.text
           
        ]
        
        
        ref.setData(data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Docuemnt added with ID: \(ref.documentID)")
            }
            
        }
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
