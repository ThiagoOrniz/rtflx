//
//  FindMoviesDataSourceExtensions.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 21/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

extension FindMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return findMoviesViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MoviesTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MoviesTableViewCell
        }
        cell?.populateView(with: findMoviesViewModel.get(index: indexPath.row))
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "RegisterMovie", bundle: nil)
        let previewVC = storyBoard.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        
        previewVC.setMovieViewModel(findMoviesViewModel.get(index: indexPath.row))
        
        
        self.navigationController?.pushViewController(previewVC, animated: true)
    }

  
    
}
