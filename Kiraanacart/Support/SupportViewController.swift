//
//  SupportViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 16/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {
    
    
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var callusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Support"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        contactUsButton.layer.cornerRadius = 10.0
        contactUsButton.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        contactUsButton.layer.borderWidth = 1
        
        callusButton.layer.cornerRadius = 10.0
        callusButton.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        callusButton.layer.borderWidth = 1
        
        
    }
    
    
    @IBAction func callusButtonClick(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func contactUsButtonClick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "SupportStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ContactusViewController") as! ContactusViewController
        self.navigationController?.pushViewController(nextViewController, animated:true)
        
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
                  super.viewWillAppear(animated)
                 self.tabBarController?.tabBar.isHidden = true
             }
       
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           // Show the navigation bar on other view controllers
         
           self.tabBarController?.tabBar.isHidden = false
       }
}
