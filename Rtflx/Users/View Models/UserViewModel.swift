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
    
    var isFriend: Bool {
        return false
    }
    
    var name: String {
        return user.name ?? ""
    }
    
    var email: String {
        return user.email ?? ""
    }
    
    init(user: User) {
        self.user = user
        loadFavoriteMovies()
    }
    
    init() {
        self.user = User()
    }
    
    func removeFriendship() {
       FirebaseManager.shared.removeFriend(user)
    }

    func addAsFriend() {
        FirebaseManager.shared.addFriend(user)
    }
    
    
    var delegate: FavoriteMoviesViewModelHasUpdatedDelegate?
    
    private var movies = [Movie]() {
        didSet {
            delegate?.favoriteMoviesViewModelHasUpdated()
        }
    }
    
    func count() -> Int {
        return movies.count
    }
    
    func get(index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movies[index])
    }
    
    
    func loadFavoriteMovies() {
        
        
        _ = FavoriteMoviesFirebase.retrieveMovies(for: user.id, completion:{ [weak self] (movies) in
            
            self?.movies = movies
            print(movies)
        })
        
        
    }

    
    
}
