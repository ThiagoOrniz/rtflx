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

class MovieDAO {

    func saveMovie(movie: Movie) {
        
        if FIRAuth.auth()?.currentUser != nil {
            
            let movieValues = ["rating": movie.rating ?? 3.0,
                               "title" : movie.title ?? "Unknown",
                               "genre" : movie.genre ?? "",
                               "year"  : movie.year ?? 0,
                               "synopsis":movie.synopsis ?? "",
                              "id": movie.id!] as [String : Any]
            
            FIRDatabase.database().reference().child("userMovies").child((FIRAuth.auth()?.currentUser?.uid)!).child(movie.id!).updateChildValues(movieValues)
            
            let likesValue = [(FIRAuth.auth()?.currentUser?.uid)!: true]
            
            FIRDatabase.database().reference().child("likes").child(movie.id!).updateChildValues(likesValue)
            
            sendPushNotification(movieId: movie.id!)

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

    
    private func sendPushNotification(movieId: String) {
        print("push notification sent")
    }
}
