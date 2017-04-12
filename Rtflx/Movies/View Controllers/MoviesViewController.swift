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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        discoverTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector( discoverTabTapped)))
        
        favoritesTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(favoriteTabTapped)))
    }
    
    func favoriteTabTapped() {
        discoverMoviesContainer.isHidden = true
        FavoriteMoviesContainer.isHidden = false
    }
    
    func discoverTabTapped() {
        discoverMoviesContainer.isHidden = false
        FavoriteMoviesContainer.isHidden = true
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        discoverTab.gestureRecognizers?.removeAll()
//        favoritesTab.gestureRecognizers?.removeAll()
//    }

}
