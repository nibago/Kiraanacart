//
//  OffersViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 14/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var Tableview: UITableView!
    
    var shopItemsImages = [String]()
    let status = ["CashBack on Grocery,Vegitables,Meat,Seafoods,organicFood,Fruid&Juice","CashBack on Grocery,Vegitables,Meat,Seafoods,organicFood,Fruid&Juice","CashBack on Grocery,Vegitables,Meat,Seafoods,organicFood,Fruid&Juice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shopItemsImages =  ["disk","disk2","disk3"]

        title = "Offers"
             navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
     func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return shopItemsImages.count
          
      }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "offers", for: indexPath) as! OffersTableViewCell
                      cell.offersImages.image = UIImage(named: shopItemsImages[indexPath.row])
                 cell.offersDescprion.text = status[indexPath.row]
                  
                    
                  cell.selectionStyle = .none
                      
               return cell
         
      }
      
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 290
      }

}
