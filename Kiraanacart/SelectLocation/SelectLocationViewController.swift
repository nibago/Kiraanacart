//
//  SelectLocationViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 28/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class SelectLocationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonClick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.show(nextViewController, sender: nil)
        
    }
    
    @IBAction func SetlocaitonButtonclick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle:nil)
        guard let popupVC = storyBoard.instantiateViewController(withIdentifier: "ExamplePopupViewController") as? ExamplePopupViewController else { return }
        popupVC.height = 300
        popupVC.topCornerRadius = 35
        popupVC.presentDuration = 1.5
        popupVC.dismissDuration = 1.5
        popupVC.shouldDismissInteractivelty = true
        popupVC.popupDelegate = self
        present(popupVC, animated: true, completion: nil)
    }
}


extension SelectLocationViewController: BottomPopupDelegate {
    
    func bottomPopupViewLoaded() {
        print("bottomPopupViewLoaded")
    }
    
    func bottomPopupWillAppear() {
        print("bottomPopupWillAppear")
    }
    
    func bottomPopupDidAppear() {
        print("bottomPopupDidAppear")
    }
    
    func bottomPopupWillDismiss() {
        print("bottomPopupWillDismiss")
    }
    
    func bottomPopupDidDismiss() {
        print("bottomPopupDidDismiss")
    }
    
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
    }
}



