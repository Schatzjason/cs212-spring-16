//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Jason Schatz on 4/18/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class MovieDetailViewController : UIViewController {
    
    var movie: Movie!
    var favoriteMovies: MovieList!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        favoriteMovies = (UIApplication.sharedApplication().delegate as! AppDelegate).favoriteMovies
        
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = movie.title
        posterImageView.image = movie.posterImage
        overviewTextView.text = movie.overview
    }
    
    @IBAction func toggleFavorite(sender: UIButton) {
        let isFavorite = favoriteMovies.toggle(movie)
        let name = isFavorite ? "favorite" : "not-favorite"
        
        favoriteButton.setImage(UIImage(named: name), forState: .Normal)
    }
}
