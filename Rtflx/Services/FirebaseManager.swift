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
        
        retrieveUsers()
    }
    
     func getUsers() {
        
        if users.count > 0 {
            retrieveUsers()
        }
    }
    
     func getFriends() {
        
        if friends.count > 0 {
            retrieveFriends()
        }
    }
    
    private func retrieveUsers() {
        
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
            
            self?.users = (self?.users.filter { user in
                return !keys.contains { key in
                    user.id == key
                }
                })!
            
            self?.friendsDelegate?.didFinishUpdatingFriends(friends: (self?.friends)!)
            self?.usersDelegate?.didFinishUpdatingUsers(users: (self?.users)!)

        }
    }
    
    func removeFriend(_ user: User) {
        
        if let index = friends.index(where: {(friend) -> Bool in
            user.id == friend.id
        }) {
            friends.remove(at: index)
            users.append(user)
            UsersFirebase.removeFriend(user.id!)
            friendsDelegate?.didFinishUpdatingFriends(friends: friends)
            usersDelegate?.didFinishUpdatingUsers(users: users)
        }
    }
    
    func addFriend(_ friend: User) {
       
        if let index = users.index(where: {(user) -> Bool in
            user.id == friend.id
        }) {
            users.remove(at: index)
            friends.append(friend)
            UsersFirebase.addFriend(friend.id!)
            friendsDelegate?.didFinishUpdatingFriends(friends: friends)
            usersDelegate?.didFinishUpdatingUsers(users: users)
        }

    }

    
   
}
