//
//  AddAddressViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 23/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class AddAddressViewController: UIViewController {
    
    @IBOutlet weak var addressTextField1: HSUnderLineTextField!
    
    
 
     @IBOutlet weak var addressTextField2: HSUnderLineTextField!
     @IBOutlet weak var addressTextField3: HSUnderLineTextField!
     @IBOutlet weak var addressTextField4: HSUnderLineTextField!
     @IBOutlet weak var addressTextField5: HSUnderLineTextField!
     @IBOutlet weak var addressTextField6: HSUnderLineTextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
                      super.viewWillAppear(animated)
                     self.tabBarController?.tabBar.isHidden = true
                 }
           
           
           override func viewWillDisappear(_ animated: Bool) {
               super.viewWillDisappear(animated)
               // Show the navigation bar on other view controllers
             
               self.tabBarController?.tabBar.isHidden = true
           }
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addressTextField1.setUnderLine()
        addressTextField2.setUnderLine()
        addressTextField3.setUnderLine()
        addressTextField4.setUnderLine()
        addressTextField5.setUnderLine()
        addressTextField6.setUnderLine()
        // Do any additional setup after loading the view.
    }
    
}

extension UITextField {
    
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}

