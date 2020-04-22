//
//  MyCustom1.swift
//  Kiraanacart
//
//  Created by CHINNA on 22/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class MyCustom1: UITableViewCell {

    @IBOutlet weak var contentImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var itemsCount: UILabel!
    
    @IBOutlet weak var qunitityLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var minuButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
