//
//  Coordinator.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 2018-09-16.
//  Copyright © 2018 Thiago Orniz Martin. All rights reserved.
//

import Foundation

/// The Coordinator protocol
public protocol Coordinator: class {
    /// The array containing any child Coordinators
    var childCoordinators: [Coordinator] { get set }
}

public extension Coordinator {
    
    /// Add a child coordinator to the parent
    public func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    /// Remove a child coordinator from the parent
    public func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
    
}
