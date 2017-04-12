//
//  DiscoverMoviesFirebase.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DiscoverMoviesFirebase {
    
    class func retrieveAllMovies(completion: @escaping (_ movies: [Movie]) -> Void) -> FIRDatabaseHandle {
        
//        refHandle = postRef.observe(FIRDataEventType.value, with: { (snapshot) in
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//            // ...
//        })
        
   return FIRDatabase.database().reference().child("movies")
            .observe(.value, with: { (snapshot) in
                // code
                var movies = [Movie]()
                
                if let valueDictionary = snapshot.value as? NSDictionary {
                    
                    for child in valueDictionary.allValues {
                        
                        if let value = child as? NSDictionary {
                                                        
                            var movie = Movie()
    
                            movie.title = value["title"] as? String
                            movie.id = value["id"] as? String
                            movie.genre = value["genre"] as? String
                            movie.actors = value["actors"] as? String
                            movie.director = value["director"] as? String
                            movie.duration = value["duration"] as? String
                            movie.year = value["year"] as? Int
                            movie.imageCover = value["imageCover"] as? String
                            movie.rating = value["rating"] as? Double
                            movie.synopsis = value["synopsis"] as? String
                            
                            movies.append(movie)

                        }

                    }
                }
                
               
                

                completion(movies)
                
//                for child in snapshot.children {
//
//
//                }
//                completion(snapshot)
            })
            { (error) in
                print(error.localizedDescription)
        }
    }

}
