//
//  File.swift
//  FavoriteActors
//
//  Created by Jason on 1/31/15.
//  Copyright (c) 2015 CCSF. All rights reserved.
//

import UIKit

class ImageCache {
    
    private var inMemoryCache = NSCache()
    
    // MARK: - Retreiving images
    
    func imageWithIdentifier(identifier: String?) -> UIImage? {
        
        // If the identifier is nil, or empty, return nil
        if identifier == nil || identifier! == "" {
            return nil
        }
        
        let path = pathForIdentifier(identifier!)
        
        // First try the memory cache
        if let image = inMemoryCache.objectForKey(path) as? UIImage {
            return image
        }
        
        // Next Try the hard drive
        if let data = NSData(contentsOfFile: path) {
            let image = UIImage(data: data)!
            
            // Bring it up to the in-memory cache
            inMemoryCache.setObject(image, forKey: path)
            
            return image
        }
        
        return nil
    }
    
    
    // MARK: - Saving images
    
    func storeImage(image: UIImage?, withIdentifier identifier: String) {
        let path = pathForIdentifier(identifier)
        
        // If the image is nil, remove images from the cache
        if image == nil {
            inMemoryCache.removeObjectForKey(path)
            do {try NSFileManager.defaultManager().removeItemAtPath(path)} catch _ {}
            return
        }
        
        // Otherwise, keep the image in memory
        inMemoryCache.setObject(image!, forKey: path)
        
        // And in documents directory
        let data = UIImagePNGRepresentation(image!)!
        data.writeToFile(path, atomically: true)
    }
    
    
    // MARK: - Helper
    
    // The image files are stored in a directory named "Image-Cache" inside the app's documents directory
    
    func pathForIdentifier(identifier: String) -> String {
        let fullURL = imageCacheDirectoryURL.URLByAppendingPathComponent(identifier)
        
        return fullURL.path!
    }
    
    lazy var imageCacheDirectoryURL: NSURL = {
        let documentsDirectoryURL: NSURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        let imageCacheDirectoryURL = documentsDirectoryURL.URLByAppendingPathComponent("ImageCache")
        
        return imageCacheDirectoryURL
    }()
}