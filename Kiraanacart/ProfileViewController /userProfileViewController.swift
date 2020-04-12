//
//  userProfileViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 12/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var profilepicimage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var usermobieLabel: UILabel!
    
    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var TableView: UITableView!
    
    
    let entries = [(title: "My Account", image: "my-account-icon"),
                   (title: "My Wallet", image: "wallet-icon"),
                   (title: "Refer a Friend", image: "refer-icon"),
                   (title: "Settings", image: "settings-icon"),
                   (title: "Support", image: "support-icon"),
                   (title: "Rate Us", image: "rate-us--icon"),
                   (title: "Notification", image: "notification-icon"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        self.navigationController?.navigationBar.topItem?.title = "Account"
        
        TableView.tableFooterView = UIView(frame: .zero)
        self.TableView.tableFooterView?.isHidden = true
        self.TableView.layer.cornerRadius = 10.0
        self.TableView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        self.TableView.layer.borderWidth = 1
     let anyAvatarImage:UIImage = UIImage(named: "child")!
        profilepicimage.maskCircle(anyImage: anyAvatarImage)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! profileTableViewCell
        let result = entries[indexPath.row]
        cell.menulistimage.image =  UIImage(named: result.image)
        cell.menunameLabel.text = result.title

        TableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        cell.selectionStyle = .none
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
        
    }

 
   
}

    
    
   
