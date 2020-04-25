//
//  SecondTableViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 25/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class SecondTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var TableviewSecond: UITableView!
    
     let items = ["Item 1", "Item2", "Item3", "Item4"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nib = UINib(nibName: "MyCustomCell", bundle: nil)
                 TableviewSecond.register(nib, forCellReuseIdentifier: "MyCustomCell")
                // Tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    

  
      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return items.count
      }
    
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as? MyCustomCell
          cell?.nameLabel.text = "Milk"
          return cell!
          
        
      }

}
