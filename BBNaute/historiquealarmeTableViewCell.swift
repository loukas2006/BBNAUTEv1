//
//  historiquealarmeTableViewCell.swift
//  BBNaute
//
//  Created by barkaouimalek on 06/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class historiquealarmeTableViewCell: UITableViewCell {

    @IBOutlet weak var alarmeTypeIcon: UIImageView!
    
    @IBOutlet weak var alarmeMessage: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
