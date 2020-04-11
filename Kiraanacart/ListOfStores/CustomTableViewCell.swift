//
//  CustomTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 11/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var ratingLabel:UILabel!
    
    @IBOutlet weak var CustomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
