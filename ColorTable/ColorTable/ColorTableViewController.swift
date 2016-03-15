//
//  MasterViewController.swift
//  ColorTable
//
//  Created by Jason Schatz on 3/15/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    var colors: [String : UIColor] = [
        
        "Red" : UIColor.redColor(),
        "Orange" : UIColor.orangeColor(),
        "Yellow" : UIColor.yellowColor(),
        "Green" : UIColor.greenColor(),
        "Blue" : UIColor.blueColor(),
        "Purple" : UIColor.purpleColor(),
        "Gray" : UIColor.grayColor(),
        "Dark Gray" : UIColor.darkGrayColor(),
        "Brown" : UIColor.brownColor(),
        "Cyan" : UIColor.cyanColor()
    ]
    
    lazy var colorNames: [String] = {
        return [String](self.colors.keys)
    }()
    
    func generateColorNameArray() -> [String] {
        return [String](self.colors.keys)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        colorNames = generateColorNameArray()
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                let colorName = colorNames[indexPath.row]
                let color = colors[colorName]
                
                controller.color = color
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == .Delete {
        }
    }
}

