//
//  AppCoordinator.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 2018-09-16.
//  Copyright © 2018 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import UIKit

/// The AppCoordinator is our first coordinator
/// In this example the AppCoordinator as a rootViewController
class AppCoordinator: RootViewCoordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    /// Window to manage
    let window: UIWindow
    
    // This is a helper so you can redirect the user to a home or login screen
    private var isLoggedIn: Bool {
        return true
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        
        return navigationController
    }()
    
    // MARK: - Init
    
    public init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        showLoginCoordinator()
    }
    
    /// Creates a new LoginCoordinator and places it into the navigation controller
    private func showLoginCoordinator() {
        // An example on how to initilize another coordinator. Please refer to the project uto-ios for more references.
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.start()
        
        self.addChildCoordinator(loginCoordinator)
        self.rootViewController.present(loginCoordinator.rootViewController, animated: false, completion: nil)
        
    }
    
}
