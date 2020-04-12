//
//  SupportExtensions.swift
//  Kiraanacart
//
//  Created by CHINNA on 12/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//


 import UIKit

import UIKit

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.image = anyImage
  }
}
