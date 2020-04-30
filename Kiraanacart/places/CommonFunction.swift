//
//  CommonFunction.swift
//  Kiraanacart
//
//  Created by CHINNA on 30/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import Foundation
import UIKit

class CommonFunctions
{
    static let sharedInstance = CommonFunctions()
    
    func showAlert(message : String, delegate : AnyObject)
    {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            print("You've pressed OK button");
        }
        
        alertController.addAction(OKAction)
        delegate.present(alertController, animated: true, completion:nil)
    }
}
