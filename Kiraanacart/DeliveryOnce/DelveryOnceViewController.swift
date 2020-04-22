//
//  DelveryOnceViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 22/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class DelveryOnceViewController: UIViewController {

      @IBOutlet weak var cal: CalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                
                title = "Delevery Once"
        
        // Do any additional setup after loading the view.
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
