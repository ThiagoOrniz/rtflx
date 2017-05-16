//
//  UserDetailsViewController.swift
//  Rtflx
//
//  Created by Thiago Orniz Martin on 17/04/17.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,FavoriteMoviesViewModelHasUpdatedDelegate {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    private var userViewModel = UserViewModel()
    
    private var isFriend = false
    
    @IBOutlet weak var moviesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 5
        addButton.setBorderShadow(shadowOpacity: 0.7)
        
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        userViewModel.delegate = self
        
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false

        nameLabel.text = userViewModel.name
        emailLabel.text = userViewModel.email
        
        if isFriend {
            addButton.setTitle("Remove", for: .normal)
        } else {
            addButton.setTitle("Add as Friend", for: .normal)
        }
    }
    
    func setupUserViewModel(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
    }
    
    func isFromFriendList(_ fromFriendsList: Bool) {
        if fromFriendsList {
            isFriend = true
        } else {
            isFriend = false
        }
    }

    @IBAction func addButtonTouched() {
        
        if isFriend {
            userViewModel.removeFriendship()
            addButton.setTitle("Add as Friend", for: .normal)

        } else {
            userViewModel.addAsFriend()
            addButton.setTitle("Remove", for: .normal)

        }
    }
    //
    
    //
    //
    //
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return userViewModel.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.populateView(with: userViewModel.get(index: indexPath.row))

        return cell
    }
    
    func favoriteMoviesViewModelHasUpdated() {
        moviesCollection.reloadData()
    }
}
