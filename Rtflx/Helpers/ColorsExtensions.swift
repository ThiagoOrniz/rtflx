//
//  ColorsExtensions.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 18/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        
    }
}

extension UIColor {
    class var primaryColor: UIColor {
        return UIColor(red: 229/255.0, green: 9/255.0, blue: 19/255.0, alpha: 1.0)
    }
}

extension UIView {
    func setBorderShadow(shadowOpacity:Float ){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1.5
        
    }
}
