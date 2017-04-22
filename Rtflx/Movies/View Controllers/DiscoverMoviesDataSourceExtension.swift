//
//  DiscoverMoviesDataSourceExtension.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

let identifier = "MoviesTableViewCell"

extension DiscoverMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discoverMoviesViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MoviesTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MoviesTableViewCell
        }
        cell?.populateView(with: discoverMoviesViewModel.get(index: indexPath.row))
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Movies", bundle: nil)
        let movieDetailsVC = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        
        movieDetailsVC.setupMovieViewModel(movieViewModel: discoverMoviesViewModel.get(index: indexPath.row),isFromDiscover: true)
        
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        
//        let currentOffset = scrollView.contentOffset.y
//        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
//        
//        if maximumOffset - currentOffset <= 20.0 { //20 is the limit to bottom
//            print("-------Bottom-------")
//            discoverMoviesViewModel.loadMovies()
//        }
//    }
    
}
