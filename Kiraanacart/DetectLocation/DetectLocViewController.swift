//
//  DetectLocViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 19/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class DetectLocViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func nextButtonClick(_ sender: UIButton) {
        
         let storyBoard : UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle:nil)
                          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            self.navigationController?.show(nextViewController, sender: nil)
        
    }
    
  

}
