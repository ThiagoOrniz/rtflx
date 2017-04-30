//
//  AppDelegate.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 10/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FirebaseAuth
import OneSignal
import SwiftyBeaver

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let console = ConsoleDestination()
        SwiftyBeaver.addDestination(console)
        
        let platform = SBPlatformDestination(appID: "1P9A7R",
                                             appSecret: "I5BbjwW8dR6eccycvPn38hqd8wtgGtxl",
                                             encryptionKey: "gujomoweaeslmQwm1hrmadidbaidMjgA")
        

        SwiftyBeaver.addDestination(platform)
        
        
        //Add this line. Replace '5eb5a37e-b458-11e3-ac11-000c2940e62c' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions, appId: "fbd05838-44e2-485a-8915-41e356715c0e")
        
        
        FIRApp.configure()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        toggleViewControllers()


        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        
        let facebookHandled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String , annotation: [:])
        
        
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: [:]) || facebookHandled
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        
        let facebookHandled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication:sourceApplication , annotation: annotation)
        
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation) || facebookHandled
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func toggleViewControllers(){
        
        FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            if user != nil {
                
                _ = FirebaseManager.shared

                let tabbar = mainStoryboard.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
                
                self.window?.rootViewController = tabbar
                
                
            } else {
                print("user is not logged")
                let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                
                self.window?.rootViewController = loginVC
                
            }
            self.window?.makeKeyAndVisible()

        }
    }


}

