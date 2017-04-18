//
//  FirebaseManager.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol FirebaseManagerDelegate{
    func didFinishUpdatingUsers(users: [User])
    func didFinishUpdateFriends()
}

class FirebaseManager {
    
    static var shared = FirebaseManager()
    private var users = [User]()
    private var friends = [User]()
    
    var delegate: FirebaseManagerDelegate?
    

    
    private init() {
        
        _ = UsersFirebase().retrieveUsers { [weak self](users) in
            self?.users = users
            
            self?.retrieveFriends()
            self?.delegate?.didFinishUpdatingUsers(users: users)
        }
    }
    
    private func retrieveFriends() {
        
        _ = UsersFirebase().retrieveFriends { [weak self](keys) in
            
            self?.friends = (self?.users.filter { user in
                return keys.contains { key in
                    user.id == key
                }
                })!
            
        }
    }
}
