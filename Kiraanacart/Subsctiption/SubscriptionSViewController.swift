//
//  SubscriptionSViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 22/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class SubscriptionSViewController: UIViewController {

    @IBOutlet weak var cal: CalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                    
                    title = "Subscripton"
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(UIDevice.current.orientation.isPortrait)
        
        // (a) do some change
    ///    cal.gotoToday()
        var viewSize: CGSize = self.view.frame.size
        print("h:\(viewSize.height)")
        print("w:\(viewSize.width)")
    //    cal.viewSize = viewSize
        cal.orientationPortrait = UIDevice.current.orientation.isPortrait
        // (b) update view
    //    cal.layoutSubviews()
        
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


