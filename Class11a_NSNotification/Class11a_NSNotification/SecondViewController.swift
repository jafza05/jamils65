//
//  SecondViewController.swift
//  Class11a_NSNotification
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver(self, selector: #selector(notifyFromFirst(_:)), name: "FromFirst", object: nil)
    }
    
    func notifyFromFirst(sender: AnyObject?){
        let userInfo = ["message":"This came from second"]
        let notification = NSNotification(name: "FromSecond", object: self, userInfo: userInfo)
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var secondOutlet: UILabel!
    
    @IBAction func secondButton(sender: AnyObject) {
    }

}

