//
//  ResultsViewController.swift
//  Throwaway1
//
//  Created by ccsfcomputers on 3/1/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var playerMove: String = "No Move..."
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Results"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = playerMove
    }
    
}
