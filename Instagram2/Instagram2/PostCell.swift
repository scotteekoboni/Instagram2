//
//  PostCell.swift
//  Instagram2
//
//  Created by Scott Guidoboni on 2/19/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
import ParseUI

class PostCell: UITableViewCell {
    @IBOutlet weak var captionView: UITextView!
    
    @IBOutlet weak var postImageView: PFImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
