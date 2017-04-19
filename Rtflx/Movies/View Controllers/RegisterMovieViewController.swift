//
//  RegisterMovieViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 18/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class RegisterMovieViewController: UIViewController {

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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        scrollView.registerForKeyboardNotifications()
        navigationController?.navigationBar.transparentNavigationBar()
        addHideKeyboardWhenTapped()
    }

    private func setupTextFields() {
        
        titleTextField.setAccessoryBar(with: genreTextField)
        genreTextField.setAccessoryBar(with: actorsTextField)
        actorsTextField.setAccessoryBar(with: yearTextField)
        yearTextField.setAccessoryBar(with: nil)
    }
    
    @IBAction func ratingSliderValueChanged(_ sender: UISlider) {
        
        ratingLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func searchMovieButtonTouched() {
    }

}


//Title
//Genre
//Synopsis
//Actors
//Year
//Image cover
//Rating (input manually from user from 0 to 10)
