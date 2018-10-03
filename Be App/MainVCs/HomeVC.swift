//
//  HomeVC.swift
//  Be App
//
//  Created by Taylor Smith on 9/5/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    
    var user: User!
    
    var postsArray: [UserPost] = []
    let db = Firestore.firestore()
    
   let storage = Storage.storage()
    let pathRef = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/beapp4488.appspot.com/o/u8uDEUq9qTSUOHPSpThILDZdELY2%2FprofileImage.jpeg?alt=media&token=54645577-e10d-4c57-bee6-a6d984f0e2af")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(red: 0, green: 150/255.0, blue: 150.0/255, alpha: 1)
        
        profileImage.layer.cornerRadius = profileImage.bounds.height/2
        profileImage.clipsToBounds = true 
        
        
        tableView.rowHeight = UITableView.automaticDimension
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            
            guard let user = user else { return }
            self.user = User(authData: user)
            self.loadPosts()
            print(self.user)
            
        }

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadPosts()
    }
    



    @IBAction func postButton(_ sender: Any) {
        
        performSegue(withIdentifier: "PostSegue", sender: nil)
        
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
           print("You are signed out!")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    
    }
    

    func loadPosts() {
        
        db.collection("user").document(user.uid).collection("posts").getDocuments() { snapShot, error in
            
            
            if let error = error {
                print("error getting documents")
            } else {
                
                for document in snapShot!.documents {
                    
                    let post = UserPost(userID: self.user.uid, time: document.data()["date"] as! Date , postID: document.documentID , post: document.data()["post"] as! String)
                    
                    print("post: \(post.post)")
                    self.postsArray.append(post)
                    self.postsArray.removeDuplicates()
                    print(post.time)
                    self.tableView.reloadData()
                  
                }
            }
            
            
            
        }
    }
    
    
    func timeStampFormatter(date: Date) -> String {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        var minutes: String {
            let minute = calendar.component(.minute, from: date)
            if minute <= 9 {
                return "0\(minute)"
            } else {
                
                return "\(minute)"
            }
            
        }
        var day: String {
           let weekday = calendar.component(.weekday, from: date)
            
            switch weekday {
            case 1: return "Sunday"
            case 2: return "Monday"
            case 3: return "Tuesday"
            case 4: return "Wednesday"
            case 5: return "Thursday"
            case 6: return "Friday"
            case 7: return "Saturday"
            default: return ""
            }
            
        }
        
        if calendar.component(.weekday, from: Date()) == calendar.component(.weekday, from: date) {
            return "Today \(hour):\(minutes)"
        } else {
            
            
            return "\(day) \(hour):\(minutes)"
        }
        
    }
    
    

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCustomCell
      
        let post = postsArray[indexPath.row]
       
        pathRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            
            if let error = error {
                print("whoops no image yo")
            } else {
                
                 cell.profileImage.image = UIImage(data: data!)
            }
            
            
            
        }
        
        
        
      
        cell.profileNameLabel.text = "The W Church"
        cell.timeStampLabel.text = timeStampFormatter(date: post.time)
        cell.postLabel.text = post.post
       
        
        return cell
    }
    
    
    
}
