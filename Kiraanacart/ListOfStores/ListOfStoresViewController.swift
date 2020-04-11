//
//  ListOfStoresViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 11/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ListOfStoresViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    let imageofArray  = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10","image11","image12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if #available(iOS 13.0, *) {
                 // Always adopt a light interface style.
                 overrideUserInterfaceStyle = .light
             }
             
        UINavigationBar.appearance().barTintColor = Constants.BM_MainColor
          UINavigationBar.appearance().tintColor = Constants.BM_MainColor
          UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
          UINavigationBar.appearance().isTranslucent = false
//          navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.backgroundColor =  Constants.BM_MainColor
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageofArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let row = indexPath.row
        cell.CustomView.layer.borderWidth = 1
        cell.CustomView.layer.cornerRadius = 3
        cell.CustomView.layer.masksToBounds = true
        cell.CustomView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        cell.ratingLabel.layer.cornerRadius = 1.0
        cell.ratingLabel.layer.masksToBounds = true
        cell.storeImage.image = UIImage(named: imageofArray[row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 120
    }

}
