//
//  UsersTableViewCell.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfMoviesAddedLabel: UILabel!
    
    func populateView(with user: UserViewModel) {
        nameLabel.text = user.name
    }
    
}
