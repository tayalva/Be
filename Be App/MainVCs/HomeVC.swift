//
//  HomeVC.swift
//  Be App
//
//  Created by Taylor Smith on 9/5/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(red: 0, green: 150/255.0, blue: 150.0/255, alpha: 1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
