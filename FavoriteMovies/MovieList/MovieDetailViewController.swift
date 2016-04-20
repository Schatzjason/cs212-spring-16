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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteMovies = (UIApplication.sharedApplication().delegate as! AppDelegate).favoriteMovies
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = movie.title
        posterImageView.image = movie.posterImage
        overviewTextView.text = movie.overview
        
        let name = favoriteMovies.contains(movie) ? "favorite" : "not-favorite"
        favoriteButton.setImage(UIImage(named: name), forState: .Normal)
        
        print(movie.JSONForm)
    }
    
    @IBAction func toggleFavorite(sender: UIButton) {
        favoriteMovies.toggle(movie)
        configureUI()
    }
}
