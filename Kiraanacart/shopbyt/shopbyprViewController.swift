//
//  shopbyprViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 23/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

import BmoViewPager

private let mainColor = UIColor(red: 1.0/255.0, green: 55.0/255.0, blue: 132.0/255.0, alpha: 1.0)

class shopbyprViewController:UIViewController {
    
    

    @IBOutlet weak var viewPagerNavigationBar: BmoViewPagerNavigationBar!
       @IBOutlet weak var viewPager: BmoViewPager!
    
    
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var Tableview: UITableView!
    @IBOutlet weak var segmentcont: UISegmentedControl!
    @IBOutlet weak var Searchcontol: UISearchBar!
    @IBOutlet weak var shoplogimage: UIImageView!
  
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = nil

//                   let button = UIButton(type: .custom)
//                   button.setImage(UIImage (named: "search-icon"), for: .normal)
//                   button.frame = CGRect(x: 30.0, y: 0.0, width: 35.0, height: 35.0)
//                   button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
//                   button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
//                   let barButtonItem = UIBarButtonItem(customView: button)
//
                   let button2 = UIButton(type: .custom)
                   button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
                   button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
                   button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
                   button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
              
                   let barButtonItem2 = UIBarButtonItem(customView: button2)
                   self.navigationItem.rightBarButtonItems = [barButtonItem2]
           
        
//        let nib = UINib(nibName: "MyCustomCell", bundle: nil)
//                 Tableview.register(nib, forCellReuseIdentifier: "MyCustomCell")
//                // Tableview.dataSource = self
//
        
       viewPager.dataSource = self
                viewPagerNavigationBar.autoFocus = false
                viewPagerNavigationBar.viewPager = viewPager
                
                viewPager.layer.borderWidth = 1.0
                viewPager.layer.cornerRadius = 5.0
                viewPager.layer.masksToBounds = true
                viewPager.layer.borderColor = UIColor.white.cgColor
        
        
        // Do any additional setup after loading the view.
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


extension shopbyprViewController: BmoViewPagerDataSource {
    // Optional
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17.0),
            NSAttributedString.Key.foregroundColor : UIColor.groupTableViewBackground
        ]
    }
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17.0),
            NSAttributedString.Key.foregroundColor : mainColor
        ]
    }
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedBackgroundView(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> UIView? {
        let view = UnderLineView()
        view.marginX = 8.0
        view.lineWidth = 5.0
        view.strokeColor = mainColor
        return view
    }
    func bmoViewPagerDataSourceNaviagtionBarItemTitle(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> String? {
        if page == 0
        {
            return "House Grosery"
        }
        else if page == 1{
         return "Home & Clean"
        } else {
            return "House Grosery"
        }
    }
    
    // Required
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 3
    }
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "FirstTableViewController") as? FirstTableViewController {
                return vc
            }
        case 1:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondTableViewController") as? SecondTableViewController {
                return vc
            }
            case 2:
                       if let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdTableViewController") as? ThirdTableViewController {
                           return vc
                       }
        
        default:
            break
        }
        return UIViewController()
    }
}
