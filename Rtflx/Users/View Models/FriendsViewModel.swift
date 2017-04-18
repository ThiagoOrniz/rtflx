//
//  FriendsViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 18/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol FriendsViewModelHasUpdatedDelegate{
    func friendsViewModelHasUpdated()
}

class FriendsViewModel: FirebaseManagerFriendsDelegate {
    
    var delegate: FriendsViewModelHasUpdatedDelegate?
    
    
    private var friends = [User]() {
        didSet {
            delegate?.friendsViewModelHasUpdated()
        }
    }
    
    init() {
        FirebaseManager.shared.friendsDelegate = self
        FirebaseManager.shared.getFriends()
    }
    
    func count() -> Int {
        return friends.count
    }
    
    func get(index: Int) -> UserViewModel {
        return UserViewModel(user: friends[index])
    }
    
    func didFinishUpdatingFriends(friends: [User]) {
        self.friends = friends
    }
    
}
