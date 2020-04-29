//
//  SlotDetailsViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 23/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class SlotDetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func procceedButtonclick(_ sender: UIButton) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "DelveryDetailsStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DeliveryDetailsViewController") as! DeliveryDetailsViewController
        self.navigationController?.show(nextViewController, sender: true)
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
                      super.viewWillAppear(animated)
                     self.tabBarController?.tabBar.isHidden = true
                 }
           
           
           override func viewWillDisappear(_ animated: Bool) {
               super.viewWillDisappear(animated)
               // Show the navigation bar on other view controllers
             
               self.tabBarController?.tabBar.isHidden = true
           }
       
    
}
