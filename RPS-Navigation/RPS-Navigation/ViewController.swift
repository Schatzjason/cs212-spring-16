//
//  ViewController.swift
//  Throwaway1
//
//  Created by ccsfcomputers on 3/1/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Move"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .Plain, target: self, action: "showHistory")
    }
    
    func showHistory() {
        print("history")
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let c = segue.destinationViewController as! ResultsViewController
        
        switch segue.identifier! {
        case "Scissors", "Paper":
            c.playerMove = segue.identifier!
        default:
            assert(false, "bad segue: \(segue.identifier)")
        }
    }
    
    @IBAction func throwTheRock(sender: UIButton) {
        let c = storyboard!.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        c.playerMove = "Rock"
        
        self.navigationController!.pushViewController(c, animated: true)
    }
    
    @IBAction func throwTheScissors() {
        performSegueWithIdentifier("Scissors", sender: nil)
    }
}






