//
//  NotificationViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 16/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var Tableview: UITableView!
    
    let ListofImages = ["image1","image2","image3","image4","image5"]
    let TextDescripton = ["shop is closed please oder on monday","25% discount is avilable on today","your Order from the More closed delivered on next two days","25% discount is avilable on today","shop is closed please oder on monday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notification"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListofImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
        cell.selectionStyle = .none
        cell.showimage.image = UIImage(named: ListofImages[indexPath.row])
        cell.showNotification.text = TextDescripton[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 143
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
                   super.viewWillAppear(animated)
                  self.tabBarController?.tabBar.isHidden = true
              }
        
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            // Show the navigation bar on other view controllers
          
            self.tabBarController?.tabBar.isHidden = false 
        }
    
    
}
