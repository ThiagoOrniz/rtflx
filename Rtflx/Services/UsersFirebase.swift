//
//  UsersFirebase.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class UsersFirebase {
    

    
    func retrieveUsers( completion: @escaping (_ users: [User]) -> Void) -> FIRDatabaseHandle  {
       
        FIRDatabase.database().reference().child("users")
            .observeSingleEvent(of: .value, with: { (snapshot) in

//            .observe(.value, with: { (snapshot) in
        
                var users = [User]()
                
                if let valueDictionary = snapshot.value as? NSDictionary {
                    
                    for child in valueDictionary.allValues {
                        
                        if let value = child as? NSDictionary {
                            
                            let name = value["name"] as? String
                            let email = value["email"] as? String
                            let uid = value["uid"] as? String
//                            let photo
                        
                            let user = User(id: uid!, name: name!, email: email ?? "")
                            
                            if user.id != (FIRAuth.auth()?.currentUser?.uid)! {
                                users.append(user)
                            }
                            
                        }
                        
                    }
                }
                
                completion(users)
                
            })
            { (error) in
                print(error.localizedDescription)
        }
        return 1
    }
    
    func retrieveFriends( completion: @escaping (_ keys: [String]) -> Void) -> FIRDatabaseHandle  {
        
        FIRDatabase.database().reference().child("friendships")
            .child((FIRAuth.auth()?.currentUser?.uid)!)
            .observeSingleEvent(of: .value, with: { (snapshot) in

//            .observe(.value, with: { (snapshot) in
        
                var keys = [String]()
                
                if let valueDictionary = snapshot.value as? NSDictionary {
                    
                    for key in valueDictionary.allKeys {
                        keys.append(key as! String)
                    }
                }
                
                completion(keys)
                
            })
            { (error) in
                print(error.localizedDescription)
        }

        return 1
    }
    
    class func removeFriend(_ uid: String) {
        
        FIRDatabase.database() .reference().child("friendships").child((FIRAuth.auth()?.currentUser?.uid)!).child(uid).setValue(nil)
        
    }
    
    class func addFriend(_ uid: String) {
        FIRDatabase.database() .reference().child("friendships").child((FIRAuth.auth()?.currentUser?.uid)!).child(uid).setValue(true)
    }
    
    
}
