//
//  FilterViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 22/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

  
    @IBOutlet weak var Tableview: UITableView!
    
       let items = ["img1", "img2", "img3", "img4","img5","img6"]
    
      
    
    override func viewDidLoad() {
        super.viewDidLoad()

       navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                   
                   title = "Filter By Product"
        
        
               let nib = UINib(nibName: "MyCustom1", bundle: nil)
                Tableview.register(nib, forCellReuseIdentifier: "MyCustom1")
                Tableview.dataSource = self
        
     
        let button2 = UIButton(type: .custom)
                     button2.tintColor = .white
                     button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
                     button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
                     button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
                     button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
                     button2.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
                     let barButtonItem2 = UIBarButtonItem(customView: button2)
                     self.navigationItem.rightBarButtonItems = [barButtonItem2]
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonClicked(sender: UIBarButtonItem) {

              let storyBoard : UIStoryboard = UIStoryboard(name: "CartStoryboard", bundle:nil)
              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddCartViewController") as! AddCartViewController
              self.navigationController?.show(nextViewController, sender: nil)
              
          }
    
      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return items.count
      }
    
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustom1") as? MyCustom1
        cell?.contentImage.image = UIImage(named:items[indexPath.row])
        
        cell?.plusButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
         // cell?.nameLabel.text = "Milk"
          return cell!
          
    }

    
    
    @objc func connected(sender: UIButton)
    {
       
        
        
        let actionSheet = UIAlertController(title: "Do you Want Product Subscribe or Deleivery once", message: "", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Subscribe", style: .default) { (action) in
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "SubScriptonStoryboard", bundle:nil)
                               let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SubscriptionSViewController") as! SubscriptionSViewController
                               self.navigationController?.show(nextViewController, sender: nil)
            //Perform any actions specific to action 1 in your class
        }
        let action2 = UIAlertAction(title: "Delivery Once", style: .default) { (action) in
            //Perform any actions specific to action 2 in your class
            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "DeliveryonceStoryboard", bundle:nil)
                                          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DelveryOnceViewController") as! DelveryOnceViewController
                                          self.navigationController?.show(nextViewController, sender: nil)
            
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil) //Will just dismiss the action sheet
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    
    
      
      override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
          self.tabBarController?.tabBar.isHidden = true
      }
    
      
      override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            // Show the navigation bar on other view controllers
          
            self.tabBarController?.tabBar.isHidden = true
        }
      
    

}
