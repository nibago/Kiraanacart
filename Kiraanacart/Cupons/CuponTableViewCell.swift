//
//  CuponTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 20/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class CuponTableViewCell: UITableViewCell {

    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var discountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
