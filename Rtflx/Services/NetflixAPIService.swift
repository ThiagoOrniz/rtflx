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
    
    class func getMovie(for title: String, completion: @escaping (_ movie: Movie?) -> Void) {
        
        Alamofire.request("http://netflixroulette.net/api/api.php?title=\(title)")
        .responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    print(value)
                    if json["errorcode"].int != nil {
                        completion(nil)
                        return
                    }
                    
                    let movie = Movie(id: json["show_id"].string,
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
                    
                    completion(movie)

                break
                case .failure(let error):
                    print(error)
                    completion(nil)
                break
            }
            
        }
    
    }
}
