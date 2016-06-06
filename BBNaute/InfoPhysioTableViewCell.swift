//
//  InfoPhysioTableViewCell.swift
//  BBNaute
//
//  Created by barkaouimalek on 11/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class InfoPhysioTableViewCell: UITableViewCell {

    @IBOutlet weak var PhysioImgView: UIImageView!
    @IBOutlet weak var PhysiovalueLbl: UILabel!
  
    
    @IBOutlet weak var PhysioUnite: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
