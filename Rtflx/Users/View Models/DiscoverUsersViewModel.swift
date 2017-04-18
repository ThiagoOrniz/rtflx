//
//  DiscoverUsersViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol DiscoverUsersViewModelHasUpdatedDelegate{
    func discoverUsersViewModelHasUpdated()
}


class DiscoverUsersViewModel: FirebaseManagerDelegate {
    
    var delegate: DiscoverUsersViewModelHasUpdatedDelegate?
    
    
    private var users = [User]() {
        didSet {
            delegate?.discoverUsersViewModelHasUpdated()
        }
    }
    
    init() {
       _ = FirebaseManager.shared
        FirebaseManager.shared.delegate = self
    }
    
    func count() -> Int {
        return users.count
    }
    
    func get(index: Int) -> UserViewModel {
        return UserViewModel(user: users[index])
    }
    
    func didFinishUpdatingUsers(users: [User]) {
        self.users = users
    }
    
    func didFinishUpdateFriends() {
        
    }
    
}
