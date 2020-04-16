//
//  ShopbyProductViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 16/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ShopbyProductViewController: UIViewController,SlidingContainerViewControllerDelegate {
 
    func slidingContainerViewControllerDidShowSliderView(_ slidingContainerViewController: SlidingContainerViewController) {

        }

        func slidingContainerViewControllerDidHideSliderView(_ slidingContainerViewController: SlidingContainerViewController) {

        }
        
       var mainView : ShopbyProductViewController!
        

          var slidingContainerViewController : SlidingContainerViewController!
         var selecedTabIndex = -1
         let tabNameArray = ["First", "Second"]
    //    var tabsArray = [FirstViewController(),SecondViewController(),ThirdViewController()]
    //
        var firstView:FirstViewController?
        var secondView:SecondViewController?
        
        var previosIndex = -1
        var currentActiveIndex = 0
        var isReservationType = true
          var headerTitString = ""
    //    var slidingContainerViewController : SlidingContainerViewController!
    //    var firstView : CurrentReservations_VC!
    //    var secondView : AllReservations_VC!
        
        override func viewDidLoad() {
          super.viewDidLoad()
          navigationItem.title = "Demo"
          navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!
          ]
            
            
            if self.slidingContainerViewController != nil{
                
                self.slidingContainerViewController.view.removeFromSuperview()
                self.slidingContainerViewController.delegate = nil
                firstView = nil
                secondView = nil
                self.slidingContainerViewController = nil
                
            }
        }
        
        
        
        override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)

            firstView  = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
            firstView?.mainView = self
            firstView?.headerText = "No \(self.headerTitString)"
            firstView?.view.tag = 1
            
            secondView  = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
            secondView?.mainView = self
            firstView?.headerText = "No \(self.headerTitString)"
            secondView?.view.tag = 0
          
            let slidingContainerViewController = SlidingContainerViewController(parent: self, contentViewControllers:[firstView!,secondView!], titles:self.tabNameArray)
       
    //        let slidingContainerViewController = SlidingContainerViewController (
    //        parent: self,
    //        contentViewControllers: self.tabsArray,
    //        titles: self.tabNameArray, height : 40, sliderHeight : 49, topHeight : 0 , isComingFromLeftMenu : true)

          view.addSubview(slidingContainerViewController.view)

          slidingContainerViewController.sliderView.appearance.outerPadding = 0
          slidingContainerViewController.sliderView.appearance.innerPadding = 50
          slidingContainerViewController.sliderView.appearance.fixedWidth = true
          slidingContainerViewController.setCurrentViewControllerAtIndex(0)
          slidingContainerViewController.delegate = self
        }

        
        func viewControllerWithColorAndTitle (_ color: UIColor, title: String) -> UIViewController {
           let vc = UIViewController ()
           vc.view.backgroundColor = color

           let label = UILabel (frame: vc.view.frame)
           label.textColor = UIColor.black
           label.textAlignment = .center
           label.font = UIFont (name: "HelveticaNeue-Light", size: 25)
           label.text = title

           label.sizeToFit()
           label.center = view.center

           vc.view.addSubview(label)

           return vc
         }
       
        
      func slidingContainerViewControllerDidMoveToViewController (_ slidingContainerViewController: SlidingContainerViewController, viewController: UIViewController, atIndex: Int)
      {
          
          self.currentActiveIndex = viewController.view.tag
                 
                 if viewController == self.firstView
                 {
                     if previosIndex != viewController.view.tag
                     {
                        // self.firstView.GetAppOrRes()
                         previosIndex = viewController.view.tag
                     }
                     
                 }
                 else
                 {
                     
                     if previosIndex != viewController.view.tag
                     {
                       //  self.secondView.GetAppOrRes()
                         previosIndex = viewController.view.tag
                     }
                     
                     
                 }
      
      }
}
