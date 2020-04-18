//
//  HomeViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 11/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var Tableview: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func homeButtonClick() {
       
        print("this is calling")
        let storyBoard : UIStoryboard = UIStoryboard(name: "ListOfStoresStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListOfStoresViewController") as! ListOfStoresViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
  

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! HomeCustomTableViewCell
//             cell.groceryImage.layer.cornerRadius = 10.0
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.section == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! HomeCustomTableViewCell1
         cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! HomeCustomTableViewCell2
            
          
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 150
        }else if indexPath.section == 2
        {
            return 317
        }
        else if indexPath.section == 1
        {
            return 120
        }
        return 100
        
    }
    
    
    
}

