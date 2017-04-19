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
    
    class func getMovie(for title: String) {
        
        Alamofire.request("http://netflixroulette.net/api/api.php?title=\(title)")
        .responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
                case .success(let value):
                    let json = JSON(value)
                    print(json)

                break
                case .failure(let error):
                    print(error)
                break
            }
            
        }
    
    }
}
