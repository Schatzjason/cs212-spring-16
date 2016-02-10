//
//  ViewController.swift
//  StoryboardClickCount
//
//  Created by ccsfcomputers on 2/9/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var clickCount = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func incrementCount(sender: UIButton) {
        clickCount++
        label.text = "\(clickCount)"
    }
    
    @IBAction func decrementCount(sender: UIButton) {
        clickCount--
        label.text = "\(clickCount)"
    }
}

