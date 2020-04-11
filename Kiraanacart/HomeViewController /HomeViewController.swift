//
//  HomeViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 11/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    navigationItem.hidesBackButton = true
        
    }
    
    
    
    
    
override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.hidesBackButton = true
  }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "ListOfStoresStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListOfStoresViewController") as! ListOfStoresViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.view.setNeedsLayout()
        navigationController?.view.layoutIfNeeded()
    }
    
}
