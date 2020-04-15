//
//  Extensions.swift
//  Kiraanacart
//
//  Created by CHINNA on 10/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var isValidContact: Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
}
