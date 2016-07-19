//
//  StatisticsViewController.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/14/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var bornCount: Int = 0
    var livingCount: Int = 0
    var diedCount: Int = 0
    var emptyCount: Int = 0
    
    var rowCount = StandardEngine.sharedInstance.rows
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set up the listener for the notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timerFired", name: StandardEngine.sharedInstance.updateNotification, object: nil)
        
        
    }
    
    //After the NSNotification of TimerFired is received, this function will execute to step through the current state CellState grid and count how many of each cellstate exist and output those values into the VC labesl
    
    func timerFired() {
        for x in 0..<StandardEngine.sharedInstance.rows {
            for y in 0..<StandardEngine.sharedInstance.cols{
                switch StandardEngine.sharedInstance.grid[x,y] {
                case: .living {
                    self.livingCount += 1
                }
                case: .died {
                    self.diedCount += 1
                }
                case: .born {
                    self.bornCount += 1
                }
                case: .empty {
                    self.emptyCount += 1
                }
                }
            }
        }
        
        self.livingCount.text = String(livingCount)
        
        self.diedCount.text = String(diedCount)
        
        self.bornCount.text = String(bornCount)
        
        self.emptyCount.text = String(emptyCount)
        

    }
    
    
    @IBOutlet weak var bornCount: UILabel!
    
    @IBOutlet weak var livingCount: UILabel!
    
    @IBOutlet weak var diedCount: UILabel!
    
    @IBOutlet weak var emptyCount: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

