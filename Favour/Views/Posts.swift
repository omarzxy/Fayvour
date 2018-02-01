//
//  Posts.swift
//  Favour
//
//  Created by Omar Ali,Mohamud on 2018-01-09.
//  Copyright © 2018 Omar Ali Mohamud. All rights reserved.
//

import UIKit

class Posts: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
