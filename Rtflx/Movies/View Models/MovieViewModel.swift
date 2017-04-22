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
            return movie.title?.uppercased() ?? "UNKNOWN"
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
    
    var director: String {
        return movie.director ?? ""
    }
    
    var synopsis: String {
        return movie.synopsis ?? ""
    }
    
    var imageCoverPath: String {
        return movie.imageCover ?? ""
    }
    var hasRating: Bool {
        let rating = movie.rating ?? 0.0

        if rating == 0 {
            return false
        }
        return true
    }
    
    var rating: String {
        set {
            movie.rating = Double(newValue)
        }
        get{
            let rating = movie.rating ?? 0.0
            
            var ic_rating = "ic_rating5"
            
            if rating < 1.0 {
                ic_rating = "ic_rating1"
            }
            
            if rating >= 1.0 && rating < 2.0 {
                ic_rating = "ic_rating2"
            }

            if rating >= 2.0 && rating < 3.0 {
                ic_rating = "ic_rating3"
            }

            if rating >= 3.0 && rating < 4.0 {
                ic_rating = "ic_rating4"
            }
            
            if rating >= 4.0 && rating < 5.0 {
                ic_rating = "ic_rating5"
            }
            
            if rating >= 5.0 && rating < 6.0 {
                ic_rating = "ic_rating6"
            }
            
            if rating >= 6.0 && rating < 7.0 {
                ic_rating = "ic_rating7"
            }
            
            if rating >= 8.0 && rating < 9.0 {
                ic_rating = "ic_rating8"
            }
            
            if rating >= 9 && rating < 10.0 {
                ic_rating = "ic_rating9"
            }
            
            if rating >= 10.0 {
                ic_rating = "ic_rating10"
            }
            return ic_rating
        }
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
//        if movie.title != nil {
//            NetflixAPIService.getMovie(for: movie.title!.replacingOccurrences(of: " ", with: "+")) { [weak self] (movie) in
//                
//                if movie != nil {
//                    self?.movie = movie!
//                    self?.delegate?.movieHasUpdated()
//                    print(self?.movie)
//                } else {
//                    self?.delegate?.hasntIdentifiedAnyMovie()
//                    print("couldnt retrieve movie")
//                }
//                
//            }
//        }
    }
    
    
}
