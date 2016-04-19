//
//  AppDelegate.swift
//  MovieList
//
//  Created by Jason Schatz on 10/29/15.
//  Copyright © 2015 Jason Schatz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    
    // A convenient place to keep our shared movie list
    var favoriteMovies = MovieList(name: "Favorites")
}

