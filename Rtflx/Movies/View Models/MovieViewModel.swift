//
//  MovieViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieDataSource {
    func movieHasUpdated()
    func hasntIdentifiedAnyMovie()
}

class MovieViewModel {
    
    private var movie: Movie
    
    var delegate: MovieDataSource?
    
    var title: String {
        set {
            movie.title = newValue
        }
        get {
            return movie.title ?? "Unknown"
        }
    }
    
    var genre: String {
        return movie.genre ?? "Unknown"
    }
    
    var duration: String {
        return movie.duration ?? ""
    }
    
    var year: String {
        return movie.year != nil ? "\(movie.year!)" : ""
    }
    
    var actors: String {
        return movie.actors ?? ""
    }
    
    var synopsis: String {
        return movie.synopsis ?? ""
    }
    
    var imageCoverPath: String {
        return movie.imageCover ?? ""
    }
    
    init() {
        movie = Movie()
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func saveAsFavorite() {
        MovieDAO().saveMovie(movie: movie)
    }
    
    func removeFromFavorite() {
        MovieDAO().deleteMovie(movie: movie)
    }
    
    func search() {
        if movie.title != nil {
            NetflixAPIService.getMovie(for: movie.title!.replacingOccurrences(of: " ", with: "+")) { [weak self] (movie) in
                
                if movie != nil {
                    self?.movie = movie!
                    self?.delegate?.movieHasUpdated()
                    print(self?.movie)
                } else {
                    self?.delegate?.hasntIdentifiedAnyMovie()
                    print("couldnt retrieve movie")
                }
                
            }
        }
    }
    
    
}
