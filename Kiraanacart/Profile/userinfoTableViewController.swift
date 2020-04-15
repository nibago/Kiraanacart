//
//  userinfoTableViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 13/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class userinfoTableViewController: UITableViewController {
    
    @IBOutlet weak var CutomView: UIView!
    
    @IBOutlet weak var profilepicimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Account"
        let anyAvatarImage:UIImage = UIImage(named: "child")!
        profilepicimage.maskCircle(anyImage: anyAvatarImage)
        
        CutomView.layer.borderWidth = 1
        CutomView.layer.cornerRadius = 3
        CutomView.layer.masksToBounds = true
        CutomView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    
    
    
    
}
