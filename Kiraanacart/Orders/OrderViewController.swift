//
//  OrderViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 14/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var Tableview: UITableView!
    var shopItemsImages = [String]()
    var shopItems = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
     shopItems = ["BigBazar","More","Dmart"]
     shopItemsImages =  ["shop1","shop2","shop3"]
        
        title = "order"
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
                   let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell
                       cell.shopItemsImage.image = UIImage(named: shopItemsImages[indexPath.row])
                  cell.superMarkerName.text = shopItems[indexPath.row]
                   
                     
                   cell.selectionStyle = .none
                       
                return cell
          
       }
       
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 199
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    

    let storyBoard : UIStoryboard = UIStoryboard(name: "OrderDetailsStoryboard", bundle:nil)
          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OrderDetailsViewController") as! OrderDetailsViewController
          self.navigationController?.show(nextViewController, sender: nil)
    
    }
}
