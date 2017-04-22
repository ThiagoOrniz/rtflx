//
//  MovieDAO.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import OneSignal

class MovieDAO {

    func saveMovie(movie: Movie) {
        
        if FIRAuth.auth()?.currentUser != nil {
            
            var movieValues = [String : Any]()
            
            movieValues["rating"] = movie.rating ?? 5.0
            movieValues["title"] = movie.title ?? "Unknown"
            movieValues["genre"] = movie.genre ?? ""
            movieValues["year"] = movie.year ?? 0
            movieValues["synopsis"] = movie.synopsis ?? ""
            movieValues["imageCover"] = movie.imageCover ?? ""
            movieValues["duration"] = movie.duration ?? ""
            movieValues["actors"] = movie.actors ?? ""
            movieValues["director"] = movie.director ?? ""
            movieValues["id"] = movie.id!

            FIRDatabase.database() .reference().child("userMovies").child((FIRAuth.auth()?.currentUser?.uid)!).child(movie.id!).updateChildValues(movieValues)
            
            FIRDatabase.database().reference().child("movies").child(movie.id!).updateChildValues(movieValues)
            
            let likesValue = [(FIRAuth.auth()?.currentUser?.uid)!: true]
            
            FIRDatabase.database().reference().child("likes").child(movie.id!).updateChildValues(likesValue)
            

            
            sendPushNotification(movieTitle: movie.title ?? "")

        } else {
            print("user is not signed in")
        }
    }
    
    
    func deleteMovie(movie: Movie) {
        
        if FIRAuth.auth()?.currentUser != nil {
            
            FIRDatabase.database().reference().child("userMovies").child((FIRAuth.auth()?.currentUser?.uid)!).child(movie.id!).setValue(nil)
            
            FIRDatabase.database().reference().child("likes").child(movie.id!)
            .child(((FIRAuth.auth()?.currentUser?.uid)!)).setValue(nil)
            
        } else {
            print("user is not signed in")
        }
    }

    
    private func sendPushNotification(movieTitle: String) {

        
//        OneSignal postNotification(["contents": ["en": "Test Message"], "include_player_ids": ["3009e210-3166-11e5-bc1b-db44eb02b120"]])

        
      
        
        print("push notification sent")
    }
}
