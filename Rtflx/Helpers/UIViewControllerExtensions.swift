//
//  UIViewControllerExtensions.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 19/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showDismissAlertMessage(withTitle title:String, andBody body:String) {
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { [weak self] (_) in
            
           _ = self?.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    func showOkAlertMessage(withTitle title:String, andBody body:String) {
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addHideKeyboardWhenTapped() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    func tapped() {
        self.view.endEditing(true)
    }
    
}
