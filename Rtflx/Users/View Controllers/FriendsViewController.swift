//
//  FriendsViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 18/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, FriendsViewModelHasUpdatedDelegate {

    @IBOutlet weak var friendsTableView: UITableView!
    
    var friendsViewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsViewModel.delegate = self
        
        friendsTableView.rowHeight = UITableViewAutomaticDimension
        friendsTableView.estimatedRowHeight = 80
    }
    
    func friendsViewModelHasUpdated() {
        friendsTableView.reloadData()
    }



}
