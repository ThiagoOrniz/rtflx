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
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    private var movieViewModel: MovieViewModel?
    private var isFromDiscover: Bool = false
    
    @IBOutlet weak var ratingImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.text = movieViewModel?.title
        genreLabel.text = movieViewModel?.genre
        actorsLabel.text = movieViewModel?.actors
        synopsisLabel.text = movieViewModel?.synopsis
        yearLabel.text = movieViewModel?.year
        directorLabel.text = movieViewModel?.director
        durationLabel.text = movieViewModel?.duration
        coverImageView.fetchImage(forPath: movieViewModel?.imageCoverPath ?? "")
        ratingImageView.image = UIImage(named: movieViewModel!.rating)
        
        
        if isFromDiscover {
            let saveButtomItem = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(MovieDetailsViewController.saveButtonTouched))
            
            self.navigationItem.setRightBarButton(saveButtomItem, animated: true)
            
        } else {
            let removeButtomItem = UIBarButtonItem(title: "REMOVE", style: .plain, target: self, action: #selector(MovieDetailsViewController.removeButtonTouched))
            
            self.navigationItem.setRightBarButton(removeButtomItem, animated: true)

        }
        
    }

    func saveButtonTouched() {
        
        movieViewModel?.saveAsFavorite()
        showDismissAlertMessage(withTitle: "Movie saved!", andBody: "")
    }
    
    func removeButtonTouched() {
        
        movieViewModel?.removeFromFavorite()
        showDismissAlertMessage(withTitle: "Movie removed!", andBody: "")
    }

    func setupMovieViewModel(movieViewModel: MovieViewModel, isFromDiscover: Bool) {
        self.movieViewModel = movieViewModel
        self.isFromDiscover = isFromDiscover
    }

}
