//
//  ConfigurationViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/29/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class ConfigurationViewController: UITableViewController {
    
    private var names: Array<String> = ["name1","nameTWO"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {

        let url = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!
        let fetcher = Fetcher()
        
        fetcher.requestJSON(url) { (json, message) in
            if let json = json,

            everything = json as? AnyObject {
                let contents = everything["contents"] as? Array<Array<Int>>
                let names = everything["title"] as? String

                
                print(contents)
                print(names)
                //print (self.names)
            }
            
                //print(json)

                //print(self.title)
                //print(self.contents)
                
                let op = NSBlockOperation {
                    self.tableView.reloadData()
                }
                
                NSOperationQueue.mainQueue().addOperation(op)
                
                
                //print(dict["base"], dict["coord"])
                //print(self.names)

                
            
        }
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Default")
            else {
                preconditionFailure("missing Default reuse identifier")
        }
        let row = indexPath.row
        guard let nameLabel = cell.textLabel else {
            preconditionFailure("wtf?")
        }
        nameLabel.text = names[row]
        cell.tag = row
        return cell
    }
    
    override func tableView(tableView: UITableView,
                            commitEditingStyle editingStyle: UITableViewCellEditingStyle,
                                               forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            names.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath],
                                             withRowAnimation: .Automatic)
        }
    }

    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editingRow = (sender as! UITableViewCell).tag
        let editingString = names[editingRow]
        guard let editingVC = segue.destinationViewController as? EditViewController
            else {
                preconditionFailure("Another wtf?")
        }
        editingVC.name = editingString
        editingVC.commit = {
            self.names[editingRow] = $0
            let indexPath = NSIndexPath(forRow: editingRow, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath],
                                                  withRowAnimation: .Automatic)
        }
    }
    */
    
    
}
