//
//  ReferViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 15/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ReferViewController: UIViewController {

    @IBOutlet weak var referalcodeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Refer & Earn"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        referalcodeLabel.layer.masksToBounds = true
        referalcodeLabel.layer.cornerRadius = 3
        referalcodeLabel.layer.borderWidth = 1
        referalcodeLabel.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    

 

}
