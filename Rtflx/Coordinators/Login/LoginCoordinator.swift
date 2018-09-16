//
//  LoginCoordinator.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 2018-09-16.
//  Copyright © 2018 Thiago Orniz Martin. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: RootViewCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        
        return navigationController
    }()
    
    private lazy var loginController: UIViewController = {
        let loginController = UIViewController()
        loginController.view.backgroundColor = .cyan
        return loginController
    }()
    
    func start() { // You could inject values as parameters of this method to be used in the view controller
        self.navigationController.viewControllers = [loginController]
    }
    
}

