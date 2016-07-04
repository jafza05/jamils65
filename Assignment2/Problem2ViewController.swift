//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Jamil Afza on 7/2/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController {
    
    let height: Int = 9
    let width: Int = 9
    
    var beforeArray = [[Bool]](count: 9, repeatedValue: Array(count: 9, repeatedValue: false))
    var afterArray = [[Bool]](count: 9, repeatedValue: Array(count: 9, repeatedValue: false))
    
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

        // Do any additional setup after loading the view.
        
    }
    @IBAction func runPress(sender: AnyObject) {
        

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
        
        
    }
    


    @IBAction func runIteration(sender: AnyObject) {
        
        var aboveLine: Int = 0
        var belowLine: Int = 0
        var toLeft: Int = 0
        var toRight: Int = 0
        var vNeighbors = [Int] (count: 3, repeatedValue: 0)
        var hNeighbors = [Int] (count: 3, repeatedValue: 0)
        
        
//        for h in 0..<height {
//            for w in 0..<width {
        
        let h = 8
        let w = 8
        var neighborCount: Int = 0
        
                switch h {
                case 0:
                    aboveLine = height
                    belowLine = h + 1
                case height:
                    aboveLine = h - 1
                    belowLine = 0
                default:
                    aboveLine = h - 1
                    belowLine = h + 1
                }
                
                switch w {
                case 0:
                    toLeft = width
                    toRight = w + 1
                case width:
                    toLeft = w - 1
                    toRight = 0
                default:
                    toLeft = w - 1
                    toRight = w + 1
                    
                }
        
                vNeighbors = [aboveLine, h, belowLine]
                hNeighbors = [toLeft, w, toRight]
                print("\(h) and \(w)")
                print("Above \(aboveLine), Below \(belowLine), Left \(toLeft), Right \(toRight)")
                print("\(vNeighbors)")
                print("\(hNeighbors)")
        
        for x in vNeighbors {
            for y in hNeighbors {
                print("\(x),\(y)")
                if (x == h && y == w) {

                }
                else if beforeArray[x][y] == true {
                    neighborCount += 1
                }
                print(beforeArray[x][y])
               
            }
            
        }
                print("\(neighborCount)")
        
            }
 //       }
        
//    }
    
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
