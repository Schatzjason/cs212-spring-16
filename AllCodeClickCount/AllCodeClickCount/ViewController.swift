//
//  ViewController.swift
//  AllCodeClickCount
//
//  Created by Jason Schatz on 2/2/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var clickCount = 0
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Some Math, to center the label and button
        let screenWidth = view.bounds.size.width
        let width: CGFloat = 100
        let x = (screenWidth - width) / 2

        // Create frame rectangles for button and label
        let labelFrame = CGRect(x: x, y: 100, width: width, height: 100)
        let buttonFrame = CGRect(x: x, y: 250, width: width, height: 44)
        let buttonFrame2 = CGRect(x: x, y: 350, width: width, height: 44)
        
        // Make a label
        label = UILabel(frame: labelFrame)
        label.text = "0"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(64)
        view.addSubview(label)
        
        // Make a button
        let button = UIButton(type: .System)
        button.frame = buttonFrame
        button.setTitle("Increment", forState: .Normal)
        button.addTarget(self, action: "incrementCount:", forControlEvents: .TouchDown)
        view.addSubview(button)

        // Make a button
        let button2 = UIButton(type: .System)
        button2.frame = buttonFrame2
        button2.setTitle("Decrement", forState: .Normal)
        button2.addTarget(self, action: "decrementCount:", forControlEvents: .TouchDown)
        
        view.addSubview(button2)
    }
    
    func decrementCount(sender: UIButton) {
        clickCount--
        label.text = "\(clickCount)"
    }
    
    func incrementCount(sender: UIButton) {
        clickCount++
        label.text = "\(clickCount)"
    }
}

