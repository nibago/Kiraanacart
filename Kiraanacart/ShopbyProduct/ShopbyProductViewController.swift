//
//  ShopbyProductViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 16/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit



class ShopbyProductViewController: SJSegmentedViewController {

   var selectedSegment: SJSegmentTab?

        override func viewDidLoad() {
         
      self.navigationItem.leftBarButtonItem = nil

            let button = UIButton(type: .custom)
            button.setImage(UIImage (named: "search-icon"), for: .normal)
            button.frame = CGRect(x: 30.0, y: 0.0, width: 35.0, height: 35.0)
            //button.addTarget(target, action: nil, for: .touchUpInside)
                        button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
                            button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
            let barButtonItem = UIBarButtonItem(customView: button)

            
            let button2 = UIButton(type: .custom)
            button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
            button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
            button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
            button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
            //button.addTarget(target, action: nil, for: .touchUpInside)

            let barButtonItem2 = UIBarButtonItem(customView: button2)
            self.navigationItem.rightBarButtonItems = [barButtonItem, barButtonItem2]
            
 
            if let storyboard = self.storyboard {

                let headerController = storyboard
                    .instantiateViewController(withIdentifier: "HeaderViewController")

                let firstViewController = storyboard
                    .instantiateViewController(withIdentifier: "FirstViewController")
                firstViewController.title = "BREAKFAST"

                let secondViewController = storyboard
                    .instantiateViewController(withIdentifier: "SecondViewController")
                secondViewController.title = "CLEANING"

                let thirdViewController = storyboard
                    .instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
                thirdViewController?.title = "DEALS"
//                thirdViewController?.loadViewController = { (index) in
//                    self.setSelectedSegmentAt(index, animated: true)
//                }

     

                headerViewController = headerController
                segmentControllers = [firstViewController,
                                           secondViewController,
                                           thirdViewController!]
                headerViewHeight = 200
                selectedSegmentViewHeight = 5.0
              //  headerViewOffsetHeight = 31.0
                segmentTitleColor = .gray
                selectedSegmentViewColor = .green
                segmentShadow = SJShadow.dark()
                
                showsHorizontalScrollIndicator = false
                showsVerticalScrollIndicator = false
                segmentBounces = false
                delegate = self
            }

           // title = "Segment"
            super.viewDidLoad()
        }
    
    
    
      override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
          self.tabBarController?.tabBar.isHidden = true
      }
    
  @objc func didTapEditButton(sender: AnyObject) {
      print("edit")
  }

  @objc func didTapFavoriteButton(sender: AnyObject) {
      print("favorite")
  }
        func getSegmentTabWithImage(_ imageName: String) -> UIView {

            let view = UIImageView()
            view.frame.size.width = 100
            view.image = UIImage(named: imageName)
            view.contentMode = .scaleAspectFit
            view.backgroundColor = .white
            return view
        }
    }

    extension ShopbyProductViewController: SJSegmentedViewControllerDelegate {

        func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {

            if selectedSegment != nil {
                selectedSegment?.titleColor(.lightGray)
            }

            if segments.count > 0 {

                selectedSegment = segments[index]
                selectedSegment?.titleColor(.red)
            }
        }
        
        

}

