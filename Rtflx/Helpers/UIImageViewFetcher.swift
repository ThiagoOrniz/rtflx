//
//  UIImageViewFetcher.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func fetchImage(forPath path: String) {
        
        if let url =  URL(string: path) {
            DispatchQueue.global(qos: .userInitiated).async {
                
                let contentOfURL = NSData(contentsOf: url)
                DispatchQueue.main.async {
                    [weak self] in
                    
                    if let imageData = contentOfURL {
                        self?.image = UIImage(data: imageData as Data)
                    }
                }
            }
        }
    }
}
