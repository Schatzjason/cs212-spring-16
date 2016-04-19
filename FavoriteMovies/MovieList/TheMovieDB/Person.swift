//
//  Person.swift
//  TheMovieDB
//
//  Created by Jason on 1/11/15.
//

import UIKit

struct Person {
 
    struct Keys {
        static let Name = "name"
        static let ProfilePath = "profile_path"
        static let Movies = "movies"
        static let ID = "id"
    }
    
    var name = ""
    var id = 0
    var imagePath = ""
    var movies = [Movie]()
    
    init(dictionary: [String : AnyObject]) {
        name = dictionary[Keys.Name] as! String
        id = dictionary[TMDB.Keys.ID] as! Int
        
        if let pathForImgage = dictionary[Keys.ProfilePath] as? String {
            imagePath = pathForImgage
        }
    }
}

extension Person {

    /**
      image is a computed property. From outside of the struct it should look like objects
      have a direct handle to their image. In fact, they store them in an imageCache. The
      cache stores the images into the documents directory, and keeps a resonable number of
      them in memory.
    */
    
    var profileImage: UIImage? {
        get {
            return TMDB.Caches.imageCache.imageWithIdentifier(imagePath)
        }
        
        set {
            TMDB.Caches.imageCache.storeImage(profileImage, withIdentifier: imagePath)
        }
    }
}


