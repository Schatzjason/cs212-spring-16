//
//  DetailViewController.swift
//  ColorTable
//
//  Created by Jason Schatz on 3/15/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var color: UIColor!

    func configureView() {
        if let color = color {
            self.view.backgroundColor = color
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
}

