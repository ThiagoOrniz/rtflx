//
//  MovieDetailsViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var movieViewModel: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.text = movieViewModel?.title
        genreLabel.text = movieViewModel?.genre
        //        actorsLabel.text = movieViewModel.actors
        //        synopsisLabel.text = movieViewModel.synopsis
        yearLabel.text = movieViewModel?.year
        //        coverImageView.image = movieViewModel.imageCoverPath
        

    }

    func setupMovieViewModel(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
        
    }

    @IBAction func favoriteButtonTouched() {
        movieViewModel?.saveAsFavorite()
    }
}
