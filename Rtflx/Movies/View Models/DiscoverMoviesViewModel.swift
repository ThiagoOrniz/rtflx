//
//  DiscoverMoviesViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol DiscoverMoviesViewModelHasUpdatedDelegate{
   func discoverMoviesViewModelHasUpdated()
}

class DiscoverMoviesViewModel {
    
    var delegate: DiscoverMoviesViewModelHasUpdatedDelegate?
    
    private var movies = [Movie]() {
        didSet {
            delegate?.discoverMoviesViewModelHasUpdated()
        }
    }
    
    init() {
       _ = DiscoverMoviesFirebase.retrieveAllMovies(completion: { [weak self] (movies) in
            self?.movies = movies
            self?.sortBy(segmentIndex: 0)
        })
    }
    
    func count() -> Int {
        return movies.count
    }
    
    func get(index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movies[index])
    }
    
    func sortBy(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            movies = movies.sorted(by: {($0.rating ?? 0.0) > ($1.rating ?? 0.0)})
        case 1:
            movies = movies.sorted(by: {($0.genre ?? "") > ($1.genre ?? "")})
        default:
            break;
        }
    }
    
}
