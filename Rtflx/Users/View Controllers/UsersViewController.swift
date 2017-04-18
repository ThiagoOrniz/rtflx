//
//  UsersViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTab: UIView!
    @IBOutlet weak var friendsTab: UIView!
    @IBOutlet weak var usersContainer: UIView!
    @IBOutlet weak var friendsContainer: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        usersTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( usersTabTapped)))
        
        friendsTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(friendsTabTapped)))
    }
    
    func usersTabTapped() {
        friendsContainer.isHidden = true
        usersContainer.isHidden = false
    }
    
    func friendsTabTapped() {
        usersContainer.isHidden = true
        friendsContainer.isHidden = false
    }
    
}
