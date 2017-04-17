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
    var currentSegmentedIndex = 0
    var startingValue = 0
    
    private var movies = [Movie]() {
        didSet {
            delegate?.discoverMoviesViewModelHasUpdated()
        }
    }
    
    init() {
        currentSegmentedIndex = 0
        loadMovies()
    }
    
    func count() -> Int {
        return movies.count
    }
    
    func get(index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movies[index])
    }
    
    func sortBy(segmentIndex: Int) {
        currentSegmentedIndex = segmentIndex
        
        switch currentSegmentedIndex {
        case 0:
            movies = movies.sorted(by: {($0.rating ?? 0.0) > ($1.rating ?? 0.0)})
        case 1:
            movies = movies.sorted(by: {($0.genre ?? "") > ($1.genre ?? "")})
        default:
            break;
        }
    }
    
    func loadMovies() {
        
        _ = DiscoverMoviesFirebase.retrieveMovies(from: startingValue, completion:{ [weak self] (movies) in
            
            self?.movies = movies
            self?.sortBy(segmentIndex: self?.currentSegmentedIndex ?? 0)
            self?.startingValue = self?.startingValue ?? 0 + 5

        })
        

    }
    
}
