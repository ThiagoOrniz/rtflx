//
//  PreviewViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 20/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    
    var movieViewModel: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.text = movieViewModel?.title
        genreLabel.text = movieViewModel?.genre
        coverImageView.fetchImage(forPath: movieViewModel?.imageCoverPath ?? "")
        
        let saveButtomItem = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(PreviewViewController.saveButtonTouched))
        
        self.navigationItem.setRightBarButton(saveButtomItem, animated: true)
        
    }
    
    @IBAction func ratingSliderChangedValue(_ sender: UISlider) {
        ratingLabel.text = "\(Int(sender.value))"
        movieViewModel?.rating = "\(Int(sender.value))"

    }

    func setMovieViewModel(_ movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
    }
    
    
    func saveButtonTouched() {
        movieViewModel?.rating = ratingLabel.text!
        movieViewModel?.saveAsFavorite()
        
        showDismissAlertMessage(withTitle: "Movie saved!", andBody: "")
    }
    
}
