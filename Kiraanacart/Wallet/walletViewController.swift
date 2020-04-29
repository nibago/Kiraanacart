//
//  walletViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 15/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import Razorpay

class walletViewController: UIViewController {


    @IBOutlet weak var CustomView: UIView!
    @IBOutlet weak var addwallet: NSLayoutConstraint!
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var AddImage: UIImageView!
    
     var razorpay: RazorpayCheckout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
 let razorpayKey = "rzp_live_r93szJEV3Ee2S8"
        
        title = "Wallet"
          navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.addwallet.constant = 150
        self.CustomView.layoutIfNeeded()
        
        razorpay = RazorpayCheckout.initWithKey(razorpayKey, andDelegate: self)

    }
    

    @IBAction func addButtonClick(_ sender: UIButton) {
        
        
         self.addwallet.constant = 300
        
        
        
        
    }
    
    @IBAction func amountButtonClick(_ sender: UIButton) {
        
        
        self.openRazorpayCheckout()

        
        
    }
    
    
    
    private func openRazorpayCheckout() {
          // 1. Initialize razorpay object with provided key. Also depending on your requirement you can assign delegate to self. It can be one of the protocol from RazorpayPaymentCompletionProtocolWithData, RazorpayPaymentCompletionProtocol.
          let options: [String:Any] = [
              "amount" : "10000", //mandatory in paise like:- 1000 paise ==  10 rs
              "description": "purchase description",
              "image": "ss",
              "name": "Swift Series",
              "prefill": [
                  "contact": "9797979797",
                  "email": "foo@bar.com"
              ],
              "theme": [
                  "color": "#00595D"
              ]
          ]
          razorpay?.open(options)
      }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
                  super.viewWillAppear(animated)
                 self.tabBarController?.tabBar.isHidden = true
             }
       
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           // Show the navigation bar on other view controllers
         
           self.tabBarController?.tabBar.isHidden = false
       }
    
}




extension walletViewController: RazorpayPaymentCompletionProtocol {
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "Paid", message: "Payment Success", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
