//
//  LoginViewController.swift
//  Milk365
//
//  Created by CHINNA on 24/04/20.
//  Copyright © 2020 CHINNA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func skipButtonClicl(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
