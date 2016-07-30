//
//  SecondViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var beforeArray = StandardEngine.sharedInstance.grid.cells
    
    var afterArray : [Cell] = []
    
    var touchPoints = [UITouch : [CGPoint]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        for h in 0..<beforeArray.count {               //initialize first state of the array
                if Int(arc4random_uniform(3)) == 1 {
                    beforeArray[h].state = .Alive
                }
                else {
                    beforeArray[h].state = .Empty
            }
        }
        
        /*
        Glider preload for testing
        beforeArray[1].state = .Alive
        beforeArray[22].state = .Alive
        beforeArray[40].state = .Alive
        beforeArray[41].state = .Alive
        beforeArray[42].state = .Alive
        */
        
        StandardEngine.sharedInstance.grid.cells = beforeArray
        
        print(beforeArray)
        print(beforeArray.count)
    }
    
    func iterate() {
        print("This button is working")
        print(StandardEngine.sharedInstance.step())
        print(StandardEngine.sharedInstance.grid.cells)
        cellGrid.setNeedsDisplay()
    }
    
    @IBAction func btnIterate(sender: AnyObject) {
        iterate()
    }

    @IBOutlet weak var cellGrid: GridView!
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(cellGrid)
            print(position.x, position.y)
            
            let heightSpacing = cellGrid.bounds.height / CGFloat(cellGrid.rows)
            let widthSpacing = cellGrid.bounds.width / CGFloat(cellGrid.cols)
            
            let tRow = min(max(floor((position.x / (cellGrid.bounds.width / CGFloat(cellGrid.cols)))),0),CGFloat(cellGrid.cols)-1)
            let tCol = min(max(floor((position.y / (cellGrid.bounds.height / CGFloat(cellGrid.rows)))),0),CGFloat(cellGrid.rows)-1)
            
            //the min and max business is to prevent app crash if you click outside of the view
            
            print(tRow, tCol)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            
            //print("\(cellGrid.grid[Int(tRow)][Int(tCol)])")
            
            /*
             I could not get the cell to change color after clicking it. I will continue to work on this but I am hoping for some partial credit for being able to identify the cell that was clicked, invoke the toggle, and pass into the switch for color state
             
             var toggledState: CellState = cellGrid.grid[Int(tRow)][Int(tCol)].toggle()
             
             switch toggledState {
             
             case .empty, .died:
             cellGrid.livingColor.set()
             case .living, .born:
             cellGrid.emptyColor.set()
             
             }
             
             path.fill()
             */
        }
    }



}

