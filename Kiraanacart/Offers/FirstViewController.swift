//
//  FirstViewController.swift
//  segmentController
//
//  Created by Brandpier iOS on 1/6/20.
//  Copyright © 2020 Brandpier iOS. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var TableView :UITableView!
     let items = ["Item 1", "Item2", "Item3", "Item4"]

     var headerTitString = ""
    var headerText = ""
        var mainView : ShopbyProductViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

    let nib = UINib(nibName: "MyCustomCell", bundle: nil)
              TableView.register(nib, forCellReuseIdentifier: "MyCustomCell")
              TableView.dataSource = self
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
            cell?.nameLabel.text = "Hello world."
        return cell!
        
      
    }
    
   
}
