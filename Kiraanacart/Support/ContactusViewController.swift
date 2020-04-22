//
//  ContactusViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 16/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class ContactusViewController: UIViewController {
    
    @IBOutlet weak var subjectTextView: KMPlaceholderTextView!
    
    
    @IBOutlet weak var subjectHightConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var DescriptionConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var DescriptionTextView: KMPlaceholderTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ContactUs"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.subjectTextView.placeholder = "Enter Subject"
        self.subjectTextView.placeholderFont = UIFont(name: Constant.RegularFont, size: Constant.MediumFontSize)
        self.subjectTextView.font = UIFont(name: Constant.RegularFont, size: Constant.MediumFontSize)
        self.subjectTextView.textColor = UIColor.black
        
        self.DescriptionTextView.placeholder = "Enter Description"
        self.DescriptionTextView.placeholderFont = UIFont(name: Constant.RegularFont, size: Constant.MediumFontSize)
        self.DescriptionTextView.font = UIFont(name: Constant.RegularFont, size: Constant.MediumFontSize)
        self.DescriptionTextView.textColor = UIColor.black
        
        subjectTextView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        subjectTextView.layer.borderWidth = 1
        
        DescriptionTextView.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        DescriptionTextView.layer.borderWidth = 1
        
    }
    
    
    
    
}
