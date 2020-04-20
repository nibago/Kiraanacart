//
//  OTPViewController.swift
//  Kiraanacart
//
//  Created by Sriramana on 07/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var btnResendOTP: UIButton!
    @IBOutlet weak var imgOTP: UIImageView!
    @IBOutlet weak var lblVerifyMobNum: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP4: UITextField!
    var LoginStatus = false
   let prefs:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designing()
        addBottomBorderTo(textField: txtOTP1)
        addBottomBorderTo(textField: txtOTP2)
        addBottomBorderTo(textField: txtOTP3)
        addBottomBorderTo(textField: txtOTP4)
        
        
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        
        txtOTP1.backgroundColor = UIColor.clear
        txtOTP2.backgroundColor = UIColor.clear
        txtOTP3.backgroundColor = UIColor.clear
        txtOTP4.backgroundColor = UIColor.clear
        
        txtOTP1.becomeFirstResponder()
        
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        title = "OTP"
               navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    
    func designing(){
        btnResendOTP.backgroundColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        btnResendOTP.layer.cornerRadius = 13
        lblInfo.textColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        imgOTP.layer.cornerRadius = 15
    }
    func addBottomBorderTo(textField:UITextField)  {
        let layer = CALayer()
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 0.5, width: textField.frame.size.width, height: 0.5)
        textField.layer.addSublayer(layer)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == txtOTP1 {
                txtOTP2.becomeFirstResponder()
            }
            
            if textField == txtOTP2 {
                txtOTP3.becomeFirstResponder()
            }
            
            if textField == txtOTP3 {
                txtOTP4.becomeFirstResponder()
            }
            
            if textField == txtOTP4 {
                txtOTP4.resignFirstResponder()
            }
            
            textField.text = string
            
        
            
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOTP2 {
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4 {
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP1 {
                txtOTP1.resignFirstResponder()
            }
            
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
          
            return false
        }
        
        return true
    }
    
    
      func textFieldDidEndEditing(_ textField: UITextField) {
          
        if textField == self.txtOTP4
          {
              self.rightButtonClick()
          }
         let str = "\(self.txtOTP1.text!)\(self.txtOTP2.text!)\(self.txtOTP3.text!)\(self.txtOTP4.text!)"
                 print()
                
                 if str.count == 3
                 {
                   
                    prefs.set(1, forKey: "ISLOGGEDIN")
                
                    let storyBoard : UIStoryboard = UIStoryboard(name: "LocationStoryboard", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetectLocViewController") as! DetectLocViewController
                    self.navigationController?.show(nextViewController, sender: nil)
                    self.prefs.synchronize()
                    
                 }
        
          
      }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func rightButtonClick()
     {
         
        
       }

}

