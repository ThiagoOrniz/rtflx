//
//  FindMoviesViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 21/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class FindMoviesViewController: UIViewController, DidUpdateMovies {

    @IBOutlet weak var errorMessageHeight: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var nameCheck: UIImageView!
    @IBOutlet weak var directorCheck: UIImageView!
    @IBOutlet weak var actorCheck: UIImageView!    
    @IBOutlet weak var findmoviesTableView: UITableView!
    var findMoviesViewModel = FindMoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findmoviesTableView.delegate = self
        findmoviesTableView.dataSource = self
        
        findMoviesViewModel.delegate = self
        
        findmoviesTableView.rowHeight = UITableViewAutomaticDimension
        findmoviesTableView.estimatedRowHeight = 115
        
        let nameGesture = UITapGestureRecognizer(target: self, action: #selector(nameCheckTapped))
        nameGesture.cancelsTouchesInView = false
        
        nameCheck.addGestureRecognizer(nameGesture)
        
        let directorGesture = UITapGestureRecognizer(target: self, action: #selector(directorCheckTapped))
        directorGesture.cancelsTouchesInView = false
        directorCheck.addGestureRecognizer(directorGesture)
        
        let actorGesture = UITapGestureRecognizer(target: self, action: #selector(actorCheckTapped))
        actorGesture.cancelsTouchesInView = false
        actorCheck.addGestureRecognizer(actorGesture)
        
        
        self.addHideKeyboardWhenTapped()
    }

    @IBAction func searchButtonTouched() {
        tapped()
        errorMessageHeight.constant = 0

        findMoviesViewModel.searchableString = searchTextField.text!
        findMoviesViewModel.startSearching()
    
    }
    
    func nameCheckTapped() {
        errorMessageHeight.constant = 0

        nameCheck.isHighlighted = true
        directorCheck.isHighlighted = false
        actorCheck.isHighlighted = false

        findMoviesViewModel.itemChecked(0)

    }
    
    func directorCheckTapped() {
        errorMessageHeight.constant = 0

        directorCheck.isHighlighted = true
        nameCheck.isHighlighted = false
        actorCheck.isHighlighted = false
      
        
        findMoviesViewModel.itemChecked(1)
        
    }
    
    func actorCheckTapped() {
        errorMessageHeight.constant = 0

        actorCheck.isHighlighted = true
        directorCheck.isHighlighted = false
        nameCheck.isHighlighted = false
        
       
        findMoviesViewModel.itemChecked(2)
        
    }
    
    func didUpdateMovies() {
         findmoviesTableView.reloadData()
    }
    
    func couldntRetrieveAnyMovie() {
        errorMessageHeight.constant = 14
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
