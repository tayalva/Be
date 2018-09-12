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
import FirebaseStorage

class SignUpVC4: UIViewController {
    

    @IBOutlet weak var addPhotoButton: UIButton!
    
    let photoPicker = UIImagePickerController()
    var profileImage: UIImage!
    
    var email = ""
    var password = ""
    var churchName = ""
    var address = ""
    var city = ""
    var state = ""
    var zipCode = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        photoPicker.delegate = self
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
    
    @IBAction func addPhotoButton(_ sender: Any) {
        
        photoPicker.allowsEditing = false
        photoPicker.sourceType = .photoLibrary
        photoPicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)!
        present(photoPicker, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func createAccountButton(_ sender: Any) {

        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            let database = Firestore.firestore()
            guard let userID = user?.user.uid else {return}

            
            let storage = Storage.storage()
            let storageRef = storage.reference()
            var downloadURL: String!
            
//////////////////store to firestore
            func saveData() {
                let ref = database.collection("user").document(userID)
                let data = [
                    "email" : self.email,
                    "churchName": self.churchName,
                    "churchLocation" : "\(self.address), \(self.city), \(self.state) \(self.zipCode) ",
                    "missionStatement" : "test mission statement",
                    "bio" : "We love Jesus",
                    "photo" : downloadURL
                ]
                print(data)
                
                ref.setData(data) { error in
                    if let error = error {
                        print("Error adding document: \(error)")
                    } else {
                        print("Docuemnt added with ID: \(ref.documentID)")
                    }
                    
                }
            }
            
//////////////////store image to storage
            if let image = UIImageJPEGRepresentation(self.profileImage, 0.5) {
                
                    let imageRef = storageRef.child("\(userID)/profileImage.jpeg")
            
                    imageRef.putData(image, metadata: nil) { (metadata, error) in
   
                        guard let metadata = metadata else {
                            print("error uploading image!")
                            return
                        }
                        imageRef.downloadURL { url, error in
                            guard let url = url else {
                                return
                            }

                            downloadURL = url.absoluteString
                            saveData()
                        }
                }

            } else {
         
                    saveData()
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




extension SignUpVC4: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            profileImage = chosenImage
            addPhotoButton.setImage(chosenImage, for: .normal)
            dismiss(animated: true, completion: nil)
        } else {
            
            dismiss(animated: true, completion: nil)
            let alertVC = UIAlertController(
                title: "Photos Only",
                message: "Sorry, only photos can be added to a profile",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "OK",
                style:.default,
                handler: nil)
            alertVC.addAction(okAction)
            present(
                alertVC,
                animated: true,
                completion: nil)
        }
    }
    
}


























