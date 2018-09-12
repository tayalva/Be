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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(red: 0, green: 150/255.0, blue: 150.0/255, alpha: 1)
        
        profileImage.layer.cornerRadius = profileImage.bounds.height/2
        profileImage.clipsToBounds = true 
        

        
    }


    @IBAction func postButton(_ sender: Any) {
        
        performSegue(withIdentifier: "PostSegue", sender: nil)
        
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
