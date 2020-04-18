//
//  OrderTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 18/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var CustomView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var shopItemsImage: UIImageView!
    
    @IBOutlet weak var Paidamount: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quntitylabel: UILabel!
    @IBOutlet weak var paymentModeLabel: UILabel!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var superMarkerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
