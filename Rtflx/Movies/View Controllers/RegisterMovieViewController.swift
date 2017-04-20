//
//  RegisterMovieViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 18/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterMovieViewController: UIViewController, MovieDataSource {
    @IBOutlet weak var movieNotFoundLabel: UILabel!

    @IBOutlet weak var movieNotFoundHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var actorsTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    @IBOutlet weak var searchMovieButton: UIButton!
    
    var movieViewModel = MovieViewModel()
    
    var disposeBag = DisposeBag()

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        scrollView.registerForKeyboardNotifications()
        navigationController?.navigationBar.transparentNavigationBar()
        addHideKeyboardWhenTapped()
        movieViewModel.delegate = self
        
        setupRxObjects()

    }

    private func setupTextFields() {
        
        titleTextField.setAccessoryBar(with: genreTextField)
        genreTextField.setAccessoryBar(with: actorsTextField)
        actorsTextField.setAccessoryBar(with: yearTextField)
        yearTextField.setAccessoryBar(with: nil)
    }
    
    private func setupRxObjects(){
        
        
    }
    
    @IBAction func ratingSliderValueChanged(_ sender: UISlider) {
        
        
        ratingLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func searchMovieButtonTouched() {
        movieNotFoundHeight.constant = 0
        movieViewModel.title = titleTextField.text!
        tapped()
        
        movieViewModel.search()
    }
    
    func movieHasUpdated() {
        
        genreTextField.text = movieViewModel.genre
        actorsTextField.text = movieViewModel.actors
        yearTextField.text = movieViewModel.year
        synopsisTextView.text = movieViewModel.synopsis
        coverImageView.fetchImage(forPath: movieViewModel.imageCoverPath)

    }
    
    func hasntIdentifiedAnyMovie() {
        movieNotFoundHeight.constant = 14
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let previewVC = segue.destination as! PreviewViewController
        previewVC.setMovieViewModel(movieViewModel)
    }
    
}

