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
    
    private var movieViewModel: MovieViewModel?
    private var isFromDiscover: Bool = false
    
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
        
        
        if isFromDiscover {
            favoriteButton.setTitle("ADD", for: .normal)
        } else {
            favoriteButton.setTitle("REMOVE", for: .normal)
        }
        

    }

    func setupMovieViewModel(movieViewModel: MovieViewModel, isFromDiscover: Bool) {
        self.movieViewModel = movieViewModel
        self.isFromDiscover = isFromDiscover
    }

    @IBAction func favoriteButtonTouched() {
        
        if favoriteButton.title(for: .normal) == "ADD" {
            movieViewModel?.saveAsFavorite()
        } else {
            movieViewModel?.removeFromFavorite()

        }
    }
}
