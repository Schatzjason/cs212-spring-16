//
//  TheMovieDB.swift
//  TheMovieDB
//
//  Created by Jason Schatz on 1/10/15.
//

import Foundation

struct TMDBURLs {

    // MARK: - URL Helper
        
    static func URLForResource(var resource: String, var parameters: [String : AnyObject]) -> NSURL {
        
        // Add in the API Key
        parameters["api_key"] = TMDB.Constants.ApiKey
        
        // Substitute the id parameter into the resource
        if resource.rangeOfString(":id") != nil {
            assert(parameters[TMDB.Keys.ID] != nil)
            
            resource = resource.stringByReplacingOccurrencesOfString(":id", withString: "\(parameters[TMDB.Keys.ID]!)")
            parameters.removeValueForKey(TMDB.Keys.ID)
        }
        
        let urlString = TMDB.Constants.BaseURL + resource + "?" + parameterString(parameters)
        let url = NSURL(string: urlString)!
        
        return url
    }
    
    // The methods for poster image URL's is almost exactly like the method for people's profile image
    // URL's.  The only diference is the value for the defalut value of the "size" parameter.
    //
    // TMDB has different constants for images sizes. You can find the arrays of size values in the TMDB struct
    static func URLForPosterWithPath(filePath: String, size: String? = TMDB.Images.PosterSizes[1]) -> NSURL {
        
        let baseURL = NSURL(string: TMDB.Constants.BaseImageURL)!
        
        return baseURL.URLByAppendingPathComponent(size!).URLByAppendingPathComponent(filePath)
    }
    
    static func URLForProfileWithPath(filePath: String, size: String? = TMDB.Images.ProfileSizes[1]) -> NSURL {
        
        let baseURL = NSURL(string: TMDB.Constants.BaseImageURL)!
        
        return baseURL.URLByAppendingPathComponent(size!).URLByAppendingPathComponent(filePath)
    }
    
    
    // Translate a dictionary of key/values into a URL encoded parameter string
    
    private static func parameterString(parameters: [String : AnyObject]) -> String {
        
        if parameters.isEmpty {
            return ""
        }
        
        var urlKeyValuePairs = [String]()

        for (key, value) in parameters {
            
            // make sure that it is a string value
            let stringValue = "\(value)"
            
            // Escape it
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            // Append it
            
            if let escapedValue = escapedValue {
                let keyValuePair = "\(key)=\(escapedValue)"
                urlKeyValuePairs.append(keyValuePair)
            } else {
                print("Warning: trouble escaping string \"\(stringValue)\"")
            }
        }
        
        return urlKeyValuePairs.joinWithSeparator("&")
    }
}