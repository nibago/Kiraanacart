//
//  SettingViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 15/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    @IBOutlet weak var TableView: UITableView!
    var StringArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = "Settings"
        StringArray = ["Change Passworkd","Manage Address","Privacy Policies","Email Subscription","Mobile Notification"]

        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
                return StringArray.count
        } else {
            return 1
        }
    
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! SettingsTableViewCell1
                cell.nameLabel.text = StringArray[indexPath.row]
            cell.selectionStyle = .none
                cell.nameLabel.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
                    cell.nameLabel.layer.borderWidth = 1
            if indexPath.row == 3  || indexPath.row == 4  {
                cell.itemImages.image = UIImage(named: "switchOff")
            } else {
                 cell.itemImages.image = UIImage(named: "Next-icon")
            }
                
                return cell
        } else if indexPath.section == 1{
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SettingsTableViewCell2
//                          cell.nameLabel.text = StringArray[indexPath.row]
//                          cell.nameLabel.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
//                              cell.nameLabel.layer.borderWidth = 1
            return cell
    }
        return UITableViewCell()

}
}

