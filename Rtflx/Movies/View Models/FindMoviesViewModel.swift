//
//  FindMoviesViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 21/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

protocol DidUpdateMovies{
    func didUpdateMovies()
    func couldntRetrieveAnyMovie()
}


class FindMoviesViewModel {
    
    var searchableString = ""
    var item = 0
    var delegate : DidUpdateMovies?
    
    var movies = [Movie]() {
        didSet {
            delegate?.didUpdateMovies()
        }
    }
    
    func itemChecked(_ item:Int) {
        self.item = item
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(updatedMovies), name: NSNotification.Name(rawValue: "retrievedMovies"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(couldntRetrieveMovies), name: NSNotification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
        
        
    }
    
    @objc func updatedMovies(_ notification: NSNotification) {
        
        if let movies = notification.userInfo?["movies"] as? [Movie] {
            // do something with your im
            print("--------------------------------------------")
            print(movies)
            self.movies = movies
        }
    }
    
    @objc func couldntRetrieveMovies(_ notification: NSNotification) {
        delegate?.couldntRetrieveAnyMovie()
    }

    
    func count() -> Int {
        return movies.count
    }
    
    func get(index: Int) -> MovieViewModel {
        return MovieViewModel(movie: movies[index])
    }
    
    
    func startSearching() {
        
        NetflixAPIService.retrieveMovies(given: searchableString.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "+"), for: item)
    
        
    }

    
}
