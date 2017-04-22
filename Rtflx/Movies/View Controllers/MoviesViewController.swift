//
//  MoviesViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var favoritesTab: UIView!
    @IBOutlet weak var discoverTab: UIView!
    @IBOutlet weak var discoverMoviesContainer: UIView!
    @IBOutlet weak var FavoriteMoviesContainer: UIView!
   
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var discoverLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.barTintColor = UIColor.lightGray
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true

        discoverTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( discoverTabTapped)))
        
        favoritesTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(favoriteTabTapped)))
    }
    
    func favoriteTabTapped() {
        discoverMoviesContainer.isHidden = true
        FavoriteMoviesContainer.isHidden = false
        favoritesLabel.textColor = UIColor.primaryColor
        discoverLabel.textColor = UIColor.lightGray

    }
    
    func discoverTabTapped() {
        discoverMoviesContainer.isHidden = false
        FavoriteMoviesContainer.isHidden = true
        discoverLabel.textColor = UIColor.primaryColor
        favoritesLabel.textColor = UIColor.lightGray
    }

}
