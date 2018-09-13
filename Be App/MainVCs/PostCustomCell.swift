//
//  PostCustomCell.swift
//  Be App
//
//  Created by Taylor Smith on 9/13/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import UIKit

class PostCustomCell: UITableViewCell {
    
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


