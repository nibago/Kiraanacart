//
//  ViewControllerPage3.swift
//  Milk365
//
//  Created by CHINNA on 25/04/20.
//  Copyright © 2020 CHINNA. All rights reserved.
//

import UIKit

class ViewControllerPage3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func skipButtonClicl(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.show(nextViewController, sender: nil)
        
    }
}
