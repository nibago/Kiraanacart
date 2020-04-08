//
//  OTPViewController.swift
//  Kiraanacart
//
//  Created by Sriramana on 07/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var imgOTP: UIImageView!
    @IBOutlet weak var lblVerifyMobNum: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        designing()
        addBottomBorderTo(textField: txtOTP1)
        addBottomBorderTo(textField: txtOTP2)
        addBottomBorderTo(textField: txtOTP3)
        addBottomBorderTo(textField: txtOTP4)
        // Do any additional setup after loading the view.
    }
    func designing(){
        btnResendOTP.backgroundColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        btnResendOTP.layer.cornerRadius = 13
        lblInfo.textColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        imgOTP.layer.cornerRadius = 15
    }
    func addBottomBorderTo(textField:UITextField)  {
        let layer = CALayer()
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 0.5, width: textField.frame.size.width, height: 0.5)
        textField.layer.addSublayer(layer)
    }

}
