//
//  ViewController.swift
//  Kiraanacart
//
//  Created by Sriramana on 06/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appIMG: UIImageView!
    @IBOutlet weak var txtMobileNum: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblRequest: UILabel!
    @IBOutlet weak var btnTermsConditions: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designing()
        
        // Do any additional setup after loading the view.
    }
    func designing(){
        //appIMG
        appIMG.layer.cornerRadius = 15
        
        //lblRequest
        lblRequest.textColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        lblRequest.font = UIFont(name: "Roboto", size: 34.0)
        //txtMobileNum
        txtMobileNum.layer.cornerRadius = 13
        txtMobileNum.clipsToBounds = true
        txtMobileNum.layer.borderWidth = 1
        txtMobileNum.layer.borderColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        
        //btnNext
        btnNext.layer.cornerRadius = 13
        btnNext.backgroundColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        
        //btnTermsConditions
        btnTermsConditions.tintColor = #colorLiteral(red: 0.0431372549, green: 0.3450980392, blue: 0.368627451, alpha: 1)
        
    }

}

