//
//  PercentageViewController.swift
//  ModalSegues
//
//  Created by ccsfcomputers on 2/23/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

class PercentageViewController: UIViewController {

    @IBOutlet var label:UILabel!
    
    var percentage:Float = 0.22 // To be set by other view controller
    
    
    @IBAction func dismissMyself(sender:UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        label.text = "\(Int(percentage*100))%"
        
    }

}
