//
//  walletViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 15/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class walletViewController: UIViewController {

    @IBOutlet weak var CustomView: UIView!
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var AddImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Wallet"
          navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       
//            
//            let yourBackImage = UIImage(named: "Back-Icon")
//                       navigationController?.navigationBar.backIndicatorImage = yourBackImage
//                       navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
//        title = "Wallet"
        
        
        // Do any additional setup after loading the view.
    }
    

  

}
