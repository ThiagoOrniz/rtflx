//
//  MovieCollectionViewCell.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 30/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var wrapperView: UIView!
    

    func populateView(with movie: MovieViewModel) {
        
        wrapperView.setBorderShadow(shadowOpacity: 0.7)
        wrapperView.layer.cornerRadius = 8
        movieImageView.layer.cornerRadius = 8


        movieImageView.fetchImage(forPath: movie.imageCoverPath)

    }
}
