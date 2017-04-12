//
//  RetrieveDataManager.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation

class RetrieveMovie {
    
    class func getMovies() -> [Movie] {
        
        var movie1 = Movie()
        movie1.id = "1"
        movie1.title = "Movie1"
        
        var movie2 = Movie()
        movie2.id = "2"
        movie2.title = "Movie2"
        
        var movie3 = Movie()
        movie3.id = "3"
        movie3.title = "Movie3"
        
        
        return [movie1, movie2, movie3]
    }

}
