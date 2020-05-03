//
//  FirstTableViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 25/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import Razorpay

class FirstTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var TableviewFirst: UITableView!
     var razorpay: RazorpayCheckout!
    
       let razorpayKey = "rzp_live_r93szJEV3Ee2S8"
    
    let items = ["Item 1", "Item2", "Item3", "Item4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        razorpay = RazorpayCheckout.initWithKey(razorpayKey, andDelegate: self)
        
        self.TableviewFirst.estimatedRowHeight = 114
        self.TableviewFirst.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: "MyCustomCell", bundle: nil)
        TableviewFirst.register(nib, forCellReuseIdentifier: "MyCustomCell")
        
        self.navigationController?.isNavigationBarHidden = false
        // Tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
          // self.tabBarController?.tabBar.isHidden = false 
       }
       
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as? MyCustomCell
        cell?.nameLabel.text = "Milk"
        return cell!
    }
    
    
    
    
    @IBAction func procceedButtonclick(_ sender: UIButton) {
        
        
          let storyBoard : UIStoryboard = UIStoryboard(name: "CartStoryboard", bundle:nil)
               let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddCartViewController") as! AddCartViewController
               self.navigationController?.show(nextViewController, sender: nil)
        
//
//
//        let storyBoard : UIStoryboard = UIStoryboard(name: "SlotDetailsStoryboard", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SlotDetailsViewController") as! SlotDetailsViewController
//        self.navigationController?.show(nextViewController, sender: true)
//
    }
    
    
    private func openRazorpayCheckout() {
          // 1. Initialize razorpay object with provided key. Also depending on your requirement you can assign delegate to self. It can be one of the protocol from RazorpayPaymentCompletionProtocolWithData, RazorpayPaymentCompletionProtocol.
          let options: [String:Any] = [
              "amount" : "1000", //mandatory in paise like:- 1000 paise ==  10 rs
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
    
    
}


extension FirstTableViewController: RazorpayPaymentCompletionProtocol {
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
