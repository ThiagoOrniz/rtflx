//
//  DiscoverMoviesViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class DiscoverMoviesViewController: UIViewController, DiscoverMoviesViewModelHasUpdatedDelegate {
    
    @IBOutlet weak var discoverMoviesTableView: UITableView!
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    
    var discoverMoviesViewModel = DiscoverMoviesViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discoverMoviesTableView.delegate = self
        discoverMoviesTableView.dataSource = self
        discoverMoviesViewModel.delegate = self
        
        discoverMoviesTableView.rowHeight = UITableViewAutomaticDimension
        discoverMoviesTableView.estimatedRowHeight = 115
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        discoverMoviesViewModel.sortBy(segmentIndex: sortSegmentControl.selectedSegmentIndex)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        let movieDetailViewController = segue.destination as! MovieDetailViewController
//        
//        if let selectedIndexPath = discoverMoviesTableView.indexPathForSelectedRow {
//            movieDetailViewController.setMovie(discoverMoviesViewModel.get(index: selectedIndexPath.row))
//        } else {
//            print ("couldnt get selected item")
//        }
//        
//    }
    

    func discoverMoviesViewModelHasUpdated() {
        discoverMoviesTableView.reloadData()
    }
}
