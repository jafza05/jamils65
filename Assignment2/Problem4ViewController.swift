//
//  Problem4ViewController.swift
//  Assignment2
//
//  Created by Jamil Afza on 7/2/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class Problem4ViewController: UIViewController {

    var iterationCounter: Int = 0
    
    let height: Int = 10
    let width: Int = 10
    
    var beforeArray = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
    var afterArray = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Problem 4"
        
        print("Problem 4 View Controller Loaded!")
        
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
            for w in 0..<width {
                if beforeArray[h][w] == true {
                    aliveCount += 1
                }
            }
        }
        
        lblAliveCells.text = "There are \(aliveCount) living cells."
        
        lblMatrix.text =  "\(beforeArray)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblAliveCells: UILabel!
    @IBOutlet weak var lblMatrix: UILabel!
    @IBAction func Iterate(sender: AnyObject) {
        lblMatrix.text = "\(step2(beforeArray).afterArray)"
        lblAliveCells.text = "There are \(step2(beforeArray).aliveCells) living cells."
        beforeArray = step2(beforeArray).afterArray
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
