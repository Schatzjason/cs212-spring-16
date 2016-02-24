//
//  ViewController.swift
//  ModalSegues
//
//  Created by ccsfcomputers on 2/23/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider:UISlider!
    
    @IBAction func go2(sender: UIButton) {
        
        performSegueWithIdentifier("go-2", sender: nil)
        
    }
    
    @IBAction func go3(sender: UIButton) {
        
        let controller = storyboard!.instantiateViewControllerWithIdentifier("PercentageViewController") as! PercentageViewController
        
        
        controller.percentage = slider.value
        presentViewController(controller, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! PercentageViewController
        controller.percentage = slider.value
        
    }
    

}

