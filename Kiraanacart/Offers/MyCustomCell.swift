//
//  MyCustomCell.swift
//  segmentController
//
//  Created by Brandpier iOS on 1/6/20.
//  Copyright © 2020 Brandpier iOS. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
