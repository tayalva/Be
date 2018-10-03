//
//  UserPost.swift
//  Be App
//
//  Created by Taylor Smith on 9/27/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import Foundation


struct UserPost: Hashable {
    
    
    var userID: String
    var time: Date
    var postID: String 
    var post: String
    
    
    init(userID: String, time: Date, postID: String, post: String) {
        
        self.userID = userID
        self.time = time
        self.postID = postID
        self.post = post
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(postID)
    }
    
    static func == (lhs: UserPost, rhs: UserPost) -> Bool {
        return lhs.postID == rhs.postID
    }
    
}
