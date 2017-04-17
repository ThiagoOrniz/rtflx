//
//  ViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 10/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate, FBSDKLoginButtonDelegate {

    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    private var loginViewModel = LoginViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        facebookLoginButton.delegate = self

    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }
        
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential) { [weak self] (user, error) in

            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print(user?.displayName ?? "oi")
            self?.loginViewModel.updateUser(user: user!)
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        do {
            try FIRAuth.auth()?.signOut()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        FIRAuth.auth()?.signIn(with: credential) { [weak self] (user, error) in

            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print(user?.displayName ?? "oooi")
            self?.loginViewModel.updateUser(user: user!)

        }
    }
    

}

