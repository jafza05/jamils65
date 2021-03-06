//
//  ConfigurationViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/29/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit


struct Configuration {
    var title: String
    var positions: Array<Position>

    
    static func fromJSON(json: Dictionary<String, AnyObject>) -> Configuration {
        let title = json["title"] as! String
        
        let contents = json["contents"] as! Array<Array<Int>>
        
        let positions = contents.map { (intArray) -> Position in
            return Position(intArray.first!, intArray.last!)
        }
        
        return Configuration(title: title, positions: positions)
    }
}


class ConfigurationViewController: UITableViewController {

    let engine = StandardEngine.sharedInstance
    
    
    var configurations: [Configuration] {
        get {
            return engine.configurations
        }
        
        set {
            engine.configurations = newValue
        }
    }
    
    private var names: Array<String> = []
    private var presetPos: Array<Array<Array<Int>>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Karan's methods from section
        

        
        //original methods
        let url = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!
        let fetcher = Fetcher()
        
        fetcher.requestJSON(url) { (json, message) in
            if let json = json,
                
                let everything = json as? Array<Dictionary<String,AnyObject>> {
                let count = everything.count
                
                for p in 0..<count {
                    var targetDict = everything[p]
                    self.names.append(targetDict["title"] as! String)
                    self.presetPos.append(targetDict["contents"] as! Array<Array<Int>>)
                }
                //print(self.names)
                //print(self.presetPos)
            }
            
            let op = NSBlockOperation {
                self.tableView.reloadData()
            }
            
            NSOperationQueue.mainQueue().addOperation(op)
            
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        engine.loadConfigurations("https://dl.dropboxusercontent.com/u/7544475/S65g.json")
        print(configurations)
        
        if configurations.count > 1 {
            print("configurations loaded successfully")
        }
        else {
            print("configurations not loaded")
        }

    }
    
    @IBAction func addConfiguration(sender: AnyObject) {
        names.append("New Preset")
        presetPos.append([])
        let itemRow = names.count - 1
        let itemPath = NSIndexPath(forRow:itemRow, inSection: 0)
        tableView.insertRowsAtIndexPaths([itemPath], withRowAnimation: .Automatic)
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
            preconditionFailure("didn't work")
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editingRow = (sender as! UITableViewCell).tag
        let editingString = names[editingRow]
        let presetPoints = presetPos[editingRow]
        guard let configEditorVC = segue.destinationViewController as? ConfigurationEditorViewController
            else {
                preconditionFailure("no worky")
        }
        configEditorVC.name = editingString
        configEditorVC.presetPoints = presetPoints
        configEditorVC.commit = {
            print("Committing <\($0)>")
            self.names[editingRow] = $0
            let indexPath = NSIndexPath(forRow: editingRow, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath],
                                                  withRowAnimation: .Automatic)
    }
   
    }
    
    
}
