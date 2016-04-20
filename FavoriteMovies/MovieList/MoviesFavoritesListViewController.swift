//
//  MoviesFavoritesListViewController.swift
//  MovieList
//
//  Created by Jason Schatz on 4/18/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class MovieFavoritesViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteMovies: MovieList!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        favoriteMovies = (UIApplication.sharedApplication().delegate as! AppDelegate).favoriteMovies
        tableView.reloadData()
    }
    
    // Mark: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        let movie = favoriteMovies[indexPath.row]
        
        cell.textLabel!.text = movie.title
        
        return cell
    }
    
    // Deleting Movies (Incomplete)
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Remove movie from the model
        favoriteMovies.removeAtIndex(indexPath.row)
        
        // Remove row from table
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
    }
}

