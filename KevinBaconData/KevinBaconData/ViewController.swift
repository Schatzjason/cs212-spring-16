//
//  ViewController.swift
//  KevinBaconData
//
//  Created by Jason Schatz on 3/12/15.
//  Copyright (c) 2015 CCSF. All rights reserved.
//

import UIKit

/**
 * In this assignment you will use this view controller to 
 * look into how JSON data can be parsed. The data in this app
 * is in a file named "kevinBaconMoviesData". It contains the 
 * data returned from a call to TheMovieDB.com's API, requesting
 * the movies in which Kevin Bacon is a cast member or crew member.
 */

class ViewController: UIViewController {

    // All of the action begins in viewDidLoad. We load the data from the file, and then practice parsing it
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Get the path to the Kevin Bacon Data
        let filePath = NSBundle.mainBundle().pathForResource("kevinBaconMoviesData", ofType: "")!

        // Read the file into an NSData Object. This is the exact same data that we would have downloaded from 
        // TheMovieDB if we asked for the moves that Kevin Bacon has been in. From this point forward, imagine that 
        // The data has been downloaded, and we want to process it in our app.
        let data = NSData(contentsOfFile: filePath)!
        
        // The first step in processing the data is to serialize it into a JSON object. In swift, the return type of
        // this method is AnyObject?.  That is a wide open data type, it might be nil, or it might be anything else
        let options = NSJSONReadingOptions(rawValue: 0)
        let jsonObject = try! NSJSONSerialization.JSONObjectWithData(data, options: options)
        let dictionary =  jsonObject as! [String : AnyObject]
        

        // Next, we can start making assumptions about what this JSON object contains. If you look at the
        // file named kevinBaconMoviesData you will see the string that can be downloaded from TMDB. Notice
        // that at the top level it is a dictionary with two keys: "cast" and "crew". Each of those keys maps
        // to an array of dictionary objects that represent movies.
        // 
        // Here we carefull unwrap the result of dictionary["cast"].
        if let movieArray = dictionary["cast"] as? [[String : AnyObject]] {
            
            // If we get a value, we are off to the races
            processArrayOfMovieDictionaries(movieArray)
        }
    }
    
    /**
     * Write your solutions to the exercises into this method. The argument is an array of dictionary items.
     * Each dictionary represents a movie that kevin bacon has acted in.
     */
    
    func processArrayOfMovieDictionaries(array: [[String : AnyObject]]) {
        question1(array)
        question2(array)
        // question3(array), etc...
    }
    
    func question1(array: [[String : AnyObject]]) {
        // Printing each movie dictionary in the array produces some ugly results. We can do better.
        
        for m in array {
            print(m)
        }
    }
    
    func question2(array: [[String : AnyObject]]) {
        // your code here...
    }
}

