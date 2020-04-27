//
//  SupportExtensions.swift
//  Kiraanacart
//
//  Created by CHINNA on 12/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//


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

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1)
    }
    
    
    
   
    
//    struct Color {
//        static let darkBlack: UIColor = .init(hex: 0x1F1F21)
//        static let lightGray: UIColor = .init(hex: 0xc3c3ca)
//        static let darkGray: UIColor  = .init(hex: 0x878787)
//        static let red: UIColor       = .init(hex: 0xff3b30)
//        static let orange: UIColor    = .init(hex: 0xff9500)
//        static let green: UIColor     = .init(hex: 0x4cd964)
//        static let blue: UIColor      = .init(hex: 0x007aff)
//        static let purple: UIColor    = .init(hex: 0x5856d6)
//        static let yellow: UIColor    = .init(hex: 0xffcc00)
//        static let tealBlue: UIColor  = .init(hex: 0x5ac8fa)
//        static let pink: UIColor      = .init(hex: 0xff2d55)
//    }
    
    
    
    
}

extension UIView {

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }


    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
               shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
               shadowOpacity: Float = 0.4,
               shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
   @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
     }
}


