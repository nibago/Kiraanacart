//
//  profileTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 12/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {

    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var menulistimage: UIImageView!
      
      @IBOutlet weak var menunameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
