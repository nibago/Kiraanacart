//
//  OrderDetailsViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 21/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var segmentcontrol: UISegmentedControl!
    
    let tableData = ["Delvery Slot","Order Confirmed on "]
    let tdata1 = ["Rt Nagar, 10 Crsoss Road ","Monday,August 2020"]
    let tdata2 = ["Free Delevery by 7Am","08:47 PM"]
    
    @IBOutlet weak var Tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        switch segmentcontrol.selectedSegmentIndex {
        case 0:
            return tableData.count
        case 1:  // places
            
                return 10
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
      //  var cell = UITableViewCell()
            switch segmentcontrol.selectedSegmentIndex {
            case 0:  // people
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! orderDetailsTableViewCell1
                cell.deleveryTimeLabel.text = tdata2[indexPath.row]
                cell.addressLabel.text = tdata1[indexPath.row]
                cell.delieryslotLabel.text = tableData[indexPath.row]
                
                return cell

            case 1:  // places
                let placeCell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! orderDetailsTableViewCell2
                
                
                return placeCell

            default:
                break
            }
            return UITableViewCell()
           
       }
    
    
    
    @IBAction func segmentedControlActionChanged(_ sender: AnyObject) {
        Tableview.reloadData()
        switch segmentcontrol.selectedSegmentIndex {
        case 0:
          Tableview.reloadData()
        case 1:
         Tableview.reloadData()
        default:
            // shouldnt get here
            return
        }
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
}
