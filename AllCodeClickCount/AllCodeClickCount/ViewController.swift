//
//  ViewController.swift
//  AllCodeClickCount
//
//  Created by Jason Schatz on 2/2/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Orange. viewWillAppear.")
    }
    
    override func loadView() {
        super.loadView()
        
        // Some Math, to center the label and button
        let screenWidth = view.bounds.size.width
        let width: CGFloat = 100
        let height: CGFloat = 44
        let x = (screenWidth - width) / 2
        
        // Create two CGRects, to specify where the label and button should be on the screen
        // (Next week will will do this with Storyboard
        let labelFrame = CGRect(x: x, y: 150, width: width, height: height)
        let buttonFrame = CGRect(x: x, y: 250, width: width, height: height)
        
        // Make the label
        label = UILabel(frame: labelFrame)
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(36)
        
        // Make the button
        let button = UIButton(type: .System)
        button.setTitle("Increment", forState: .Normal)
        button.frame = buttonFrame
        button.addTarget(self, action: "incrementCount", forControlEvents: .TouchDown)
        
        // Add the label and the button to the view
        view.addSubview(label)
        view.addSubview(button)
        
        // A helper method. Puts the count in the label.
        displayCountInLabel()
    }
    
    func incrementCount() {
        count++
        displayCountInLabel()
    }
    
    func displayCountInLabel() {
        label.text = "\(count)"
    }
}

