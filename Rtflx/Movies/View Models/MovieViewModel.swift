//
//  MovieViewModel.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    private var movie: Movie
    
    var title: String {
        return movie.title ?? "Unknown"
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
    
    var imageCoverPath: String {
        return movie.imageCover ?? ""
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
    
    
}
