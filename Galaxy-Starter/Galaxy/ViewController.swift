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
        
        // Get UI into waiting mode
        imageView.hidden = true
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        // 2a. Create Task that can get our data
        
                // 3. In the future, on separate thread, turn data into image

                // 4. Dispatch a closure back to the main thread
                    // In the even more distant future, back on the main thread, update UI
        
                    // Get out of waiting mode
        
        // 2b. Start the task working....
    }
}




