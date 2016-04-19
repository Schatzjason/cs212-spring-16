//
//  MovieList.swift
//  MovieList
//
//  Created by Jason Schatz on 4/18/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import Foundation

class MovieList {
    
    private var movies: [Movie]
    private var name: String
    
    init(name: String) {
        self.name = name
        self.movies = [Movie]()
    }
    
    // MARK: - Support for toggling
    
    // Get the index of a movie, if it is in this list
    private func indexOf(movie: Movie) -> Int? {
        return movies.indexOf() {$0.id == movie.id}
    }
    
    // A helper, returns true if the movie is in the list
    func contains(movie: Movie) -> Bool {
        return indexOf(movie) != nil
    }
    
    // A helper, removes the movie if it is there, adds
    // it is it is not
    // 
    // returns true if the movie is in the list after the
    // operation
    func toggle(movie: Movie) -> Bool {
        
        if let index = indexOf(movie) {
            movies.removeAtIndex(index)
            return false
        } else {
            movies.append(movie)
            return true
        }
    }
    
    
    // MARK: -  Making things array like
    
    var count: Int {
        get {
            return movies.count
        }
    }
    
    subscript(index: Int) -> Movie {
        get {
            return movies[index]
        }
        
        set(newMovie) {
            movies[index] = newMovie
        }
    }
    
    // MARK: - Support for removing
    
    func removeAtIndex(index: Int) {
        movies.removeAtIndex(index)
    }
}