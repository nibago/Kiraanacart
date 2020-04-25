//
//  AddCartViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 20/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class AddCartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var Tableview: UITableView!
    
    let showimagesval = ["img1","img2"]
    let items = ["sunflowerOil","suger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Tableview.rowHeight = UITableView.automaticDimension
        title = "Cart"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5

      }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        if section == 0{
                       return 1
                  }
        if section == 2
        {
            return items.count
        }
        
         return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if indexPath.row == 0 && indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! AddTableViewCell1
        return cell
        }
       if indexPath.section == 1 && indexPath.row == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! AddTableViewCell2
        return cell
        
        }
        if indexPath.section == 2 && indexPath.row == 0{
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! AddTableViewCell3
            
            cell.showimages.image = UIImage(named:showimagesval[indexPath.row])
            cell.itemsNameLabel.text = items[indexPath.row]
               return cell
               }
              if indexPath.section == 3 && indexPath.row == 0{
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! AddTableViewCell4
                cell.ViewcupponButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
               return cell

               }
        if indexPath.section == 4 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! AddTableViewCell5
            return cell
        }
//
          return UITableViewCell()
        }
      
 
 
    
    @objc func buttonClicked(sender: UIButton){
      
        let storyBoard : UIStoryboard = UIStoryboard(name: "CuponsStoryboard", bundle:nil)
              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CuponsViewController") as! CuponsViewController
              self.navigationController?.show(nextViewController, sender: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0{
             return 110
        }else if indexPath.section == 1 {
                return 23
        }else if indexPath.section == 2{
                    return 112
               }else if indexPath.section == 3{
                       return 84
               }else if indexPath.section == 4{
                       return 266

                }
         return 100
      
        }
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = true
        }

}
