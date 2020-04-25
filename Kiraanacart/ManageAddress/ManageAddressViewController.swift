//
//  ManageAddressViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 19/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ManageAddressViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var Tableiview: UITableView!
   
    let Address1 = ["Home","Office"]
    let Address2 = ["345,10Th Cross, Ganga Nagar,RT Nagar,Bangalore,560032","345,10Th Cross, Sandyapalayout,Veernapalya,Bangalore,560045"]
    let check = ["check","uncheck"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let button2 = UIButton(type: .custom)
              button2.tintColor = .systemGreen
              button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
              button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
              button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
              button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
              //button.addTarget(target, action: nil, for: .touchUpInside)

              let barButtonItem2 = UIBarButtonItem(customView: button2)
              self.navigationItem.rightBarButtonItems = [barButtonItem2]
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Address1.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ManageTableViewCell
        cell.AddressLable1.text = Address1[indexPath.row]
        cell.addressLable2.text = Address2[indexPath.row]
        cell.selectImages.image = UIImage(named:check[indexPath.row] )
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
  
    
    @IBAction func addressButtonClick(_ sender: UIButton) {
        
                 let storyBoard : UIStoryboard = UIStoryboard(name: "AddAddressStoryboard", bundle:nil)
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
                     self.navigationController?.show(nextViewController, sender: true)
                 
        
        
    }
    
    

}
