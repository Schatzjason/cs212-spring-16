//
//  TaskAwareTableViewCell.swift
//  MovieList
//
//  Created by ccsfcomputers on 4/12/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class TaskAwareTableViewCell: UITableViewCell {
    
    private var _cellNumber: Int?
    
    var cellNumber: Int! {
        set(newValue) {
            if _cellNumber == nil {
                _cellNumber = newValue
            }
        }
        
        get {
            return _cellNumber
        }
    }

    var taskToCancelWhenReused: NSURLSessionTask? {
        
        willSet {
            if let task = taskToCancelWhenReused {
                print("canceling task...")
                task.cancel()
            }
        }
    }
    
}
