//
//  UserViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

class UserViewModel {
    
    private var user: User
    
    var name: String {
        return user.name
    }
    
    init(user: User) {
        self.user = user
    }
    
}
