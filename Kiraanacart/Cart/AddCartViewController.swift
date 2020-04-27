//
//  AddCartViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 20/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import Razorpay

class AddCartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var razorpay: RazorpayCheckout!
    
    @IBOutlet weak var Tableview: UITableView!
    
     // var razorpayObj : Razorpay? = nil
      let defaultHeight : CGFloat = 40
      let defaultWidth : CGFloat = 120
      
      let razorpayKey = "rzp_live_r93szJEV3Ee2S8"
    
    let showimagesval = ["img1","img2"]
    let items = ["sunflowerOil","suger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        razorpay = RazorpayCheckout.initWithKey(razorpayKey, andDelegate: self)
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
                       return 314

                }
         return 100
      
        }
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = true
        }

    
    
    @IBAction func openCheckoutAction(_ sender: UIButton) {
        self.openRazorpayCheckout()
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


      



    extension AddCartViewController: RazorpayPaymentCompletionProtocol {
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
