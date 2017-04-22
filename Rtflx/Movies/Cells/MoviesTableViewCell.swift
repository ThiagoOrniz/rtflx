//
//  MoviesTableViewCell.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 11/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!

    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    func populateView(with movieViewModel: MovieViewModel) {
        titleLabel.text = movieViewModel.title
        genreLabel.text = movieViewModel.genre
        durationLabel.text = movieViewModel.duration
        yearLabel.text = movieViewModel.year
        
        if movieViewModel.hasRating {
            ratingImageView.isHidden = false
        } else {
            ratingImageView.isHidden = true
        }
        
        ratingImageView.image = UIImage(named: movieViewModel.rating)
        thumbnailImageView.fetchImage(forPath: movieViewModel.imageCoverPath)
    }
    
}
