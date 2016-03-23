//
//  ViewController.swift
//  Galaxy
//
//  Created by ccsfcomputers on 3/22/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     let GalaxyURL: String = "https://s3.amazonaws.com/policymic-images/oidbjjmfalmyrfd1ohj8sjezcqu7kwxg7bpil5pddk8ky09amyszdhenheurzrj2.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.hidden = true
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
    }
    
    @IBAction func startDowload(sender: UIButton) {
        downloadGalaxy()
    }
    
    func downloadGalaxy() {
    
        // 1. URL - done
        let url = NSURL(string: GalaxyURL)!
        
        // Get UI into waiting mode
        imageView.hidden = true
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        // 2a. Create Task that can get our data
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
            
            (data, response, error) in
            
            assert(error == nil, error!.description)
            
            if let data = data {
                // 3. In the future, on separate thread, turn data into image
                let image = UIImage(data: data)

                // 4. Dispatch a closure back to the main thread
                dispatch_async(dispatch_get_main_queue()) {

                    // In the even more distant future, back on the main thread, update UI
                    self.imageView.image = image
                    
                    // Get out of waiting mode
                    self.imageView.hidden = false
                    self.activityIndicator.hidden = true
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        // 2b. Start the task working....
        task.resume()
        

    }
}




