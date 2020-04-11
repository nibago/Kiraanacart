//
//  MobileLoginViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 09/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class MobileLoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var appIMG: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblRequest: UILabel!
    @IBOutlet weak var btnTermsConditions: UIButton!
    @IBOutlet weak var txtMobileNum: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        designing()
        txtMobileNum.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func designing(){
        //appIMG
        appIMG.layer.cornerRadius = 15
        
        //lblRequest
        
        lblRequest.textColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        lblRequest.font = UIFont(name: "Roboto", size: 18.0)
        //txtMobileNum
        txtMobileNum.layer.cornerRadius = 13
        txtMobileNum.clipsToBounds = true
        txtMobileNum.layer.borderWidth = 1
        txtMobileNum.layer.borderColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        
        //btnNext
        btnNext.layer.cornerRadius = 13
        btnNext.backgroundColor = #colorLiteral(red: 0.04602403267, green: 0.4012767146, blue: 0.4401372144, alpha: 1)
        
        //btnTermsConditions
        btnTermsConditions.tintColor = #colorLiteral(red: 0.0431372549, green: 0.3450980392, blue: 0.368627451, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    @IBAction func nextButtonClick(_ sender:UIButton)
    {
        if txtMobileNum.text == ""
        {
            let alert = UIAlertController(title: "Enter Mobilenumber", message: "Enter Valid MobileNumber", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            if txtMobileNum.text!.isValidContact == true
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
                
            }else
            {
                let alert = UIAlertController(title: "Enter Mobilenumber", message: "Enter Valid MobileNumber", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    
    @IBAction func termsButtonClick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "TermsAndCondtion", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TermsCondtionViewController") as! TermsCondtionViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        txtMobileNum.keyboardType = .asciiCapableNumberPad
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        txtMobileNum.keyboardType = .asciiCapableNumberPad
        
    }
    
    // textfield.keyboardType = .asciiCapableNumberPad
    
}
