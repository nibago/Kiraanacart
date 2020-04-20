//
//  CuponsViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 20/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class CuponsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

     var colorsArray: [UIColor] = [UIColor]()
    
    let imagestest = ["50% Cashback","75% Cashback","100% Cashback","7 Days Free Milk","14 Days Free Milk","30 Days Free Milk"]
    
    @IBOutlet weak var Tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "cupons"
              navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
           getRandomColorsArray()
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagestest.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CuponTableViewCell
         let randomNumber = Int(arc4random_uniform(UInt32(imagestest.count)))
        cell.discountLabel.text = imagestest[indexPath.row]
        cell.discountLabel.backgroundColor = self.colorsArray[randomNumber]
        
     return cell
     }
    
 
    func getRandomColorsArray(){
           
           self.colorsArray = [UIColor]()
           
           for _ in 0..<imagestest.count {
               self.colorsArray.append(UIColor.random())
           }
           
       }
    
    
      override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
          self.tabBarController?.tabBar.isHidden = true
      }
    
      
//      override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            // Show the navigation bar on other view controllers
//
//            self.tabBarController?.tabBar.isHidden = false
//        }
      
}
