//
//  MyFavoritesViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class MyFavoritesViewController: UIViewController, FavoriteMoviesViewModelHasUpdatedDelegate {
    
    @IBOutlet weak var MyFavoritesTableView: UITableView!
    
    var favoriteMoviesViewModel = FavoriteMoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        MyFavoritesTableView.delegate = self
        MyFavoritesTableView.dataSource = self
        favoriteMoviesViewModel.delegate = self
        
        MyFavoritesTableView.rowHeight = UITableViewAutomaticDimension
        MyFavoritesTableView.estimatedRowHeight = 115
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func favoriteMoviesViewModelHasUpdated() {
        MyFavoritesTableView.reloadData()
    }

}
