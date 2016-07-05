//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Jamil Afza on 7/2/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController {
    
    
    var iterationCounter: Int = 0
    
    let height: Int = 10
    let width: Int = 10
    
    var beforeArray = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
    var afterArray = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        
        labelRun.text = "There are \(aliveCount) living cells."
        matrixLabel.text =  "\(beforeArray)"

        // Do any additional setup after loading the view.
        
    }
    @IBAction func runPress(sender: AnyObject) {
        
        
    }
    
    @IBAction func runIteration(sender: AnyObject) {

        iterationCounter += 1       //count how many iterations have happened, mostly for referene
        var aboveLine: Int = 0      //variable for the row number of the neighbors above target cell
        var belowLine: Int = 0      //variable for the row number of the neighbors below target cell
        var toLeft: Int = 0         //variable for the column number of the neighbors to the left of the target cell
        var toRight: Int = 0        //variable for the row number of the neighbors to the right of the target cell
        var vNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 vertical neighbor rows
        var hNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 horizontal neighbor rows
        
        
        for h in 0..<height {
            for w in 0..<width {
        
//        let h = 0  //hardcoding target cell for testing, delete before final
//            let w = 0  //hardcoding target cell for testing, delete before final
        
                var neighborAliveCount: Int = 0     //counter for how many neighbor cells are alive
        
                switch h {                          //switch statement to determine neighbor rows of target cell
                case 0:
                    aboveLine = height - 1
                    belowLine = h + 1
                case height-1:
                    aboveLine = h - 1
                    belowLine = 0
                default:
                    aboveLine = h - 1
                    belowLine = h + 1
                }
                
                switch w {                          //switch statement to determine neighbor columns of target cell
                case 0:
                    toLeft = width - 1
                    toRight = w + 1
                case width-1:
                    toLeft = w - 1
                    toRight = 0
                default:
                    toLeft = w - 1
                    toRight = w + 1
                    
                }
        
                vNeighbors = [aboveLine, h, belowLine]
                hNeighbors = [toLeft, w, toRight]
        
                var focusStatus: Bool = false   //variable for whether target cell is alive or dead in current state
                var nextState: Bool = false     //variable for whether target cell will be alive or dead for next state
        
 //               print("Current focus cell is \(h) and \(w)")  //debugging reference
 //               print("\(vNeighbors)")                        //debugging reference
 //               print("\(hNeighbors)")                        //debugging reference
        
                for x in vNeighbors {
                    for y in hNeighbors {

                        if (x == h && y == w) {
                            focusStatus = beforeArray[x][y]
                        }
                           
                        else if beforeArray[x][y] == true {
                            neighborAliveCount += 1
                        }
                
                        //print("\(x),\(y) is", beforeArray[x][y]) //delete this when deleting target cell hardcode

                    }
            
                }
        
        if focusStatus {
            switch neighborAliveCount {
            case 2,3:                       // cell stays alive
                nextState = true
                
            default:                        // cell dies
                nextState = false
            }
        }
            
        else {
            switch neighborAliveCount {
            case 3:                         // cell becomes alive
                nextState = true
                
            default:                        // cell stays dead
                nextState = false
            }
        }
        
        print("\(h),\(w) cell is \(focusStatus) and has \(neighborAliveCount) alive neighbors and will be \(nextState) in next iteration")
        afterArray[h][w] = nextState
    }
    
    
    }
        print(afterArray)
        matrixLabel.text = ("\(afterArray)")
        
        var aliveCount = 0                  //variable for counting alive cells, should probably make this a function
        
        for h in 0..<height {
            for w in 0..<width {
                if afterArray[h][w] == true {
                    aliveCount += 1
                }
            }
        }
        labelRun.text = "There are \(aliveCount) living cells after iteration \(iterationCounter)"
        
        beforeArray = afterArray            // sets before state to after state in prep for next iteration
        
        
}
    
    @IBOutlet weak var labelRun: UILabel!

    @IBOutlet weak var matrixLabel: UILabel!
    
    @IBOutlet weak var afterMatrixLabel: UILabel!
    
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
