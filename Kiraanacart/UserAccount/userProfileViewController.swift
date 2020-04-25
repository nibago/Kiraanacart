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
        
        title = "Account"
        TableView.tableFooterView = UIView(frame: .zero)
        self.TableView.tableFooterView?.isHidden = true
        self.TableView.layer.cornerRadius = 10.0
        self.TableView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        self.TableView.layer.borderWidth = 1
        let anyAvatarImage:UIImage = UIImage(named: "child")!
        profilepicimage.maskCircle(anyImage: anyAvatarImage)
        
    }
     
    override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
              self.tabBarController?.tabBar.isHidden = false
          }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
      
        self.tabBarController?.tabBar.isHidden = false
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
     TableView.heightAnchor.constraint(equalToConstant:tableView.contentSize.height).isActive = true
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? profileTableViewCell {
            
            switch cell.menunameLabel.text {
            case "My Account":
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "profileStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "userinfoTableViewController") as! userinfoTableViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
                
            case "My Wallet":
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "WalletStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "walletViewController") as! walletViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
                
            case "Refer a Friend":
                let storyBoard : UIStoryboard = UIStoryboard(name: "ReferStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReferViewController") as! ReferViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
            case "Settings":
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "SettingStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
            case "Support":
                let storyBoard : UIStoryboard = UIStoryboard(name: "SupportStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController
                self.navigationController?.pushViewController(nextViewController, animated:true)
            case "Rate Us":
                print("Rate Us")
            case "Notification":
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "NotificationStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                self.navigationController?.pushViewController(nextViewController, animated:true)
            default:
                print("nothing is selected")
            }
        }   
    }
}




