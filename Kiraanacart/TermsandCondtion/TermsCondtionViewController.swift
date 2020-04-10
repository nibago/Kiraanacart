//
//  TermsCondtionViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 09/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit



class TermsCondtionViewController: UIViewController {
    
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   infoLabel.layer.cornerRadius = 8.0
   infoLabel.layer.masksToBounds = true
        infoLabel.layer.borderColor = UIColor.darkGray.cgColor
   infoLabel.layer.borderWidth = 1.0
        
        infoLabel.text = "a Terms and Conditions agreement is an agreement that’s set out between a business and a customer that dictates how each party should behave. It dictates how your users can use your app by setting out rules that you intend for them to follow.There are numerous benefits to having concrete Terms and Conditions as a business, whether it’s for your mobile app or website.It can improve trust between your business and your customers, protect your app from abuses, and help you limit your liability and risk.As an app developer, it’s in your best interest to have Terms and Conditions set out in your app." +  "\n" + "Terms and Conditions aren’t legally required by law, and you don’t necessarily need one to launch a mobile app in an app store. But from both a legal and business perspective, it should be considered an essential" +  "\n" + "stepbusiness, whether it’s for your mobile app or website.It can improve trust between your business and your customers, protect your app from abuses, and help you limit your liability " +  "\n" + "and risk.As an app developer, it’s in your best interest to have Terms and Conditions set out in your app.Terms and Conditions aren’t legally required by law, and you don’t necessarily need one to launch a mobile app in an app store. But from both a legal and business perspective, it should be considered an essential step"
        
        title = "Terms & Condtion "
        
        // Do any additional setup after loading the view.
    }
    
}
