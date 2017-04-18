//
//  DiscoverUsersDataSourceExtensions.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

let usersIdentifier = "UsersTableViewCell"

extension DiscoverUsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discoverUsersViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: usersIdentifier) as? UsersTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: usersIdentifier, bundle: nil), forCellReuseIdentifier: usersIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: usersIdentifier) as? UsersTableViewCell
        }
        cell?.populateView(with: discoverUsersViewModel.get(index: indexPath.row))
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Users", bundle: nil)
        let userDetailsVC = storyBoard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        
        userDetailsVC.setupUserViewModel(userViewModel: discoverUsersViewModel.get(index: indexPath.row))
        
        self.navigationController?.pushViewController(userDetailsVC, animated: true)
    }
    
}
