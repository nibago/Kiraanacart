//
//  ManageTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 20/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ManageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var AddressLable1: UILabel!
    
    @IBOutlet weak var addressLable2: UILabel!
    
    
    @IBOutlet weak var addressLabel3: UILabel!
    
    @IBOutlet weak var addressLabel4: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    
    @IBOutlet weak var selectImages: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
