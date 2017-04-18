//
//  DiscoverUsersViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class DiscoverUsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    var discoverUsersViewModel = DiscoverUsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersTableView.delegate = self
        usersTableView.dataSource = self
    }


}
