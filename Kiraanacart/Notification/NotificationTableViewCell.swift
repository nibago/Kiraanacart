//
//  NotificationTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 16/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var showNotification: UILabel!
    @IBOutlet weak var showimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
        
        
        // Configure the view for the selected state
    }

    
//     func viewWillAppear(_ animated: Bool) {
//                  super.viewWillAppear(animated)
//                 self.tabBarController?.tabBar.isHidden = true
//             }
//
//
//        func viewWillDisappear(_ animated: Bool) {
//           super.viewWillDisappear(animated)
//           // Show the navigation bar on other view controllers
//
//           self.tabBarController?.tabBar.isHidden = false
//       }
    
}
