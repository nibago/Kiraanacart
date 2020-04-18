//
//  TabBarViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 10/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let viewControllers =  viewControllers else {
               return
           }
           
           for viewController in viewControllers
           {
           if let HomeNavigationController = viewController as?  HomeNavigtionViewController
           {
           if let HomeViewController  = HomeNavigationController.viewControllers.first as? HomeViewController
           {
               
               }
             }
            }
        
        // Do any additional setup after loading the view.
    }
}

