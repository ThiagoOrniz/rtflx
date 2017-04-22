//
//  NetflixAPIService.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 19/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetflixAPIService {
    
    class func retrieveMovies(given searchable: String, for item: Int) {
        
        switch item {
        case 0:
            retrieveByTitle(searchable)
            break
        case 1:
            retrieveByDirector(searchable)
            break
        case 2:
            retrieveByActor(searchable)
            
        default:
            retrieveByTitle(searchable)
        }
    }
    
    class func retrieveByTitle(_ title: String) {
        
        Alamofire.request("http://netflixroulette.net/api/api.php?title=\(title)")
            .responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(let value):
                    let json = JSON(value)
                    if json["errorcode"].int != nil {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
                        return
                    }
                    var movies = [Movie]()
                    movies.append(parseMovie(using: json))
                    
NotificationCenter.default.post(name: Notification.Name(rawValue: "retrievedMovies"), object: nil, userInfo: ["movies" : movies])
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
                    print(error)
                    break
                }
                
        }
    }
    
    class func retrieveByDirector(_ director: String) {
        
        Alamofire.request("http://netflixroulette.net/api/api.php?director=\(director)")
            .responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(let value):
                    let json = JSON(value)
                    if json["errorcode"].int != nil {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
                        return
                    }
                    
                    var movies = [Movie]()
                    for (_,subJson):(String, JSON) in json {
                        movies.append(parseMovie(using: subJson))
                    }
                    
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "retrievedMovies"), object: nil, userInfo: ["movies" : movies])
                    
                    break
                    
                case .failure(let error):
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
                    print(error)
                    break
                }
                

                
        }

        
    }
    
    class func retrieveByActor(_ actor: String) {
        
        Alamofire.request("http://netflixroulette.net/api/api.php?actor=\(actor)")
            .responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(let value):
                    let json = JSON(value)
                    if json["errorcode"].int != nil {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
                        return
                    }
                    var movies = [Movie]()
                    for (_,subJson):(String, JSON) in json {
                        movies.append(parseMovie(using: subJson))
                    }
                    
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "retrievedMovies"), object: nil, userInfo: ["movies" : movies])
                    break
                    
                case .failure(let error):
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "couldntRetrieveMovies"), object: nil)
                    print(error)
                    break
                }
                
        }

    }
    
    private class func parseMovie(using json: JSON) -> Movie {
        
        return Movie(id: "\(json["show_id"].int!)",
              title: json["show_title"].string,
              year: Int(json["release_year"].string ?? ""),
              rating: 0.0,
              genre: json["category"].string,
              actors: json["show_cast"].string,
              director: json["director"].string,
              synopsis: json["summary"].string,
              imageCover: json["poster"].string,
              duration: json["runtime"].string
        )
    }
    
//    class func getMovie(for title: String, completion: @escaping (_ movies: [Movie]?) -> Void) {
//        
//        Alamofire.request("http://netflixroulette.net/api/api.php?title=\(title)")
//        .responseJSON { (response:DataResponse<Any>) in
//            switch(response.result) {
//                case .success(let value):
//                    let json = JSON(value)
//                    print(json)
//                    print(value)
//                    if json["errorcode"].int != nil {
//                        completion(nil)
//                        return
//                    }
//                    
//                    let movie = Movie(id: json["show_id"].string,
//                        title: json["show_title"].string,
//                        year: Int(json["release_year"].string ?? ""),
//                        rating: 0.0,
//                        genre: json["category"].string,
//                        actors: json["show_cast"].string,
//                        director: json["director"].string,
//                        synopsis: json["summary"].string,
//                        imageCover: json["poster"].string,
//                        duration: json["runtime"].string
//                    )
//                    
//                    completion(movie)
//
//                break
//                case .failure(let error):
//                    print(error)
//                    completion(nil)
//                break
//            }
//            
//        }
//    
//    }
}
