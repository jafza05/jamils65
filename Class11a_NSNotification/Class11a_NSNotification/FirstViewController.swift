//
//  FirstViewController.swift
//  Class11a_NSNotification
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver(self, selector: #selector(notifyFromSecond(_:)), name: "FromSecond", object: nil)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func notifyFromSecond(notification: NSNotification?) {
        firstNotifyLabel.text = "no idea how this works"
        
    }
    
    
    @IBAction func notifySecondVC(sender: AnyObject) {
    }

    @IBOutlet weak var firstNotifyLabel: UILabel!
}

