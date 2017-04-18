//
//  FirebaseManager.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol FirebaseManagerUsersDelegate{
    func didFinishUpdatingUsers(users: [User])
}

protocol FirebaseManagerFriendsDelegate{
    func didFinishUpdatingFriends(friends: [User])
}

class FirebaseManager {
    
    static var shared = FirebaseManager()
    private var users = [User]()
    private var friends = [User]()
    
    var usersDelegate: FirebaseManagerUsersDelegate?
    var friendsDelegate: FirebaseManagerFriendsDelegate?


    
    private init() {
        
        _ = UsersFirebase().retrieveUsers { [weak self](users) in
            self?.users = users
            
            self?.retrieveFriends()
            self?.usersDelegate?.didFinishUpdatingUsers(users: users)
        }
    }
    
    private func retrieveFriends() {
        
        _ = UsersFirebase().retrieveFriends { [weak self](keys) in
            
            self?.friends = (self?.users.filter { user in
                return keys.contains { key in
                    user.id == key
                }
                })!
            
            self?.friendsDelegate?.didFinishUpdatingFriends(friends: (self?.friends)!)
        }
    }
}
