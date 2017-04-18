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
