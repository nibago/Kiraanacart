//
//  StoreListViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 01/05/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import BmoViewPager

private let mainColor = UIColor(red: 1.0/255.0, green: 55.0/255.0, blue: 132.0/255.0, alpha: 1.0)

private let mainColorBlack = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)

class StoreListViewController: UIViewController {

    
    
    
    @IBOutlet weak var viewPagerNavigationBar: BmoViewPagerNavigationBar!
    @IBOutlet weak var viewPager: BmoViewPager!
    
    override func viewDidLoad() {
        super.viewDidLoad()


            viewPager.dataSource = self
            viewPagerNavigationBar.autoFocus = false
            viewPagerNavigationBar.viewPager = viewPager
            
            
            viewPager.layer.borderWidth = 1.0
            viewPager.layer.cornerRadius = 5.0
            viewPager.layer.masksToBounds = true
            viewPager.layer.borderColor = UIColor.white.cgColor
                    // Do any additional setup after loading the view.
    }
    

    

}


extension StoreListViewController: BmoViewPagerDataSource {
    // Optional
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17.0),
            NSAttributedString.Key.foregroundColor :  mainColorBlack
        ]
    }
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17.0),
            NSAttributedString.Key.foregroundColor : Constants.BM_MainColor
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
            return "Delivery"
        }else {
            return "Self Pickup"
        }
    }
    
    // Required
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 2
    }
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ListOfStoresViewController") as? ListOfStoresViewController {
                return vc
            }
        case 1:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ListOfStoresViewController") as? ListOfStoresViewController {
                return vc
            }
        
            
        default:
            break
        }
        return UIViewController()
    }
}
