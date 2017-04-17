//
//  LoginViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class LoginViewModel {
    
    
    func updateUser(user: FIRUser ) {
        
        let userValues = ["uid": user.uid,
                    "name": user.displayName ?? "Unknown",
                    "email": user.email ?? ""]
        
          FIRDatabase.database().reference().child("users").child(user.uid).updateChildValues(userValues)
        
    }
    
}
