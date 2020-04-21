//
//  HeaderViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 17/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {

    @IBOutlet weak var headerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImage.layer.borderWidth = 1
        headerImage.layer.borderColor = UIColor.black.cgColor

        // Do any additional setup after loading the view.
    }
  

}
