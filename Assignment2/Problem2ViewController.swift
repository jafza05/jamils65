//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Jamil Afza on 7/2/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    


        // Do any additional setup after loading the view.
    }
    @IBAction func runPress(sender: AnyObject) {
        
        var beforeArray = [[Bool]](count: 5, repeatedValue: Array(count: 5, repeatedValue: false))
        
        
        let height = 5
        let width = 5
        
        for h in 0..<height {
            for w in 0..<width {
                if Int(arc4random_uniform(3)) == 1 {
                    beforeArray [h][w] = true
                }
                else {
                    beforeArray [h][w] = false
                }
            }
        }
        
        print(beforeArray)
        
        var aliveCount = 0
        
        for h in 0..<height {
            if beforeArray[h][0] == true {
                aliveCount += 1
            }
            
        }
        
        labelRun.text = "P2 View Controller Loaded \(aliveCount)"
        matrixLabel.text =  "\(beforeArray)"
        
    }
    @IBOutlet weak var labelRun: UILabel!

    @IBOutlet weak var matrixLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
