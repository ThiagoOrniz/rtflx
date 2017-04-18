//
//  FavoriteMoviesViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol FavoriteMoviesViewModelHasUpdatedDelegate{
    func favoriteMoviesViewModelHasUpdated()
}

class FavoriteMoviesViewModel {
    
    var delegate: FavoriteMoviesViewModelHasUpdatedDelegate?
    
    private var movies = [Movie]() {
        didSet {
            delegate?.favoriteMoviesViewModelHasUpdated()
        }
    }
    
    init() {
        loadFavoriteMovies()
    }
    
    func count() -> Int {
        return movies.count
    }
    
    func get(index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movies[index])
    }
    
    
    func loadFavoriteMovies() {
        
        _ = FavoriteMoviesFirebase.retrieveMovies( completion:{ [weak self] (movies) in
            
            self?.movies = movies
            print(movies)
        })
        
        
    }



}
