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
        
        
        if StandardEngine.sharedInstance.grid.rows != 0 {   //need to turn this to Points not rows
                randomize()
                print(StandardEngine.sharedInstance.grid)
        }
        
        else {
            /*
            let pointMax = points.map({ $0.maxElement()!}).maxElement()!
            StandardEngine.sharedInstance.grid.rows = pointMax * 2
            StandardEngine.sharedInstance.grid.cols = pointMax * 2
             
            reset()
            
            for p in 0..<StandardEngine.sharedInstance.grid. {
                let cPoint: [Int] = StandardEngine.sharedInstance.grid.points[p]
                let targetCell = (cPoint[1]*StandardEngine.sharedInstance.grid.cols)+cPoint[0]
                beforeArray[targetCell].state = .Alive
             
            }
            */
            StandardEngine.sharedInstance.grid.cells = beforeArray
            cellGrid.setNeedsDisplay()
        }
        
        /*
        Glider preload for testing
        beforeArray[1].state = .Alive
        beforeArray[22].state = .Alive
        beforeArray[40].state = .Alive
        beforeArray[41].state = .Alive
        beforeArray[42].state = .Alive
        */
        

    }
    
    func randomize() {
        print("reset to random")
        for h in 0..<beforeArray.count {               //initialize first state of the array
            if Int(arc4random_uniform(3)) == 1 {
                beforeArray[h].state = .Alive
            }
            else {
                beforeArray[h].state = .Empty
            }
        }
        StandardEngine.sharedInstance.grid.cells = beforeArray
        print("\(StandardEngine.sharedInstance.grid.cells)")
        cellGrid.setNeedsDisplay()
    }
    
    func iterate() {
        print("Iterate called")
        print("This button is working")
        StandardEngine.sharedInstance.step()
        //print(StandardEngine.sharedInstance.grid.cells)
        cellGrid.setNeedsDisplay()
    }
    
    @IBAction func btnIterate(sender: AnyObject) {
        iterate()
    }
    
    
    
    @IBAction func btnStart(sender: UIButton) {
        StandardEngine.sharedInstance.refreshTimer =
        NSTimer.scheduledTimerWithTimeInterval(StandardEngine.sharedInstance.refreshRate, target: self, selector: #selector(iterate), userInfo: nil, repeats: true)
        print("timer started")
    }
    
    
    
    
    @IBAction func btnStop(sender: UIButton) {
        StandardEngine.sharedInstance.refreshTimer!.invalidate()
        print("timer stopped")
        
    }
    @IBAction func btnReset(sender: AnyObject) {
        for h in 0..<StandardEngine.sharedInstance.grid.cells.count {               //set all cells to empty
            StandardEngine.sharedInstance.grid.cells[h].state = .Empty
        }
        print("Reset")
        cellGrid.setNeedsDisplay()
    }

    func reset() {
        for h in 0..<StandardEngine.sharedInstance.grid.cells.count {               //set all cells to empty
            StandardEngine.sharedInstance.grid.cells[h].state = .Empty
        }
        print("Reset")
        cellGrid.setNeedsDisplay()
    }
    
    @IBAction func btnRandom(sender: AnyObject) {
        randomize()
    }

    @IBOutlet weak var cellGrid: GridView!
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(cellGrid)
            print(position.x, position.y)
            
            let heightSpacing = cellGrid.bounds.height / CGFloat(StandardEngine.sharedInstance.rows)
            let widthSpacing = cellGrid.bounds.width / CGFloat(StandardEngine.sharedInstance.cols)
            
            let tRow = min(max(floor((position.x / (cellGrid.bounds.width / CGFloat(StandardEngine.sharedInstance.cols)))),0),CGFloat(StandardEngine.sharedInstance.cols)-1)
            let tCol = min(max(floor((position.y / (cellGrid.bounds.height / CGFloat(StandardEngine.sharedInstance.rows)))),0),CGFloat(StandardEngine.sharedInstance.rows)-1)
            
            //the min and max is to prevent app crash if you click outside of the view
            
            print(tRow, tCol)
            let touchedPoint = (Int(tCol)*Int(StandardEngine.sharedInstance.grid.cols))+Int(tRow)
            print(touchedPoint)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            switch StandardEngine.sharedInstance.grid.cells[touchedPoint].state {
                
            case .Alive, .Born:
                StandardEngine.sharedInstance.grid.cells[touchedPoint].state = .Empty
            case .Died, .Empty:
                StandardEngine.sharedInstance.grid.cells[touchedPoint].state = .Alive
            }
            
            print(StandardEngine.sharedInstance.grid.cells[touchedPoint].state)
            path.fill()
            
            
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

             */
             cellGrid.setNeedsDisplay()
            
            //path.fill()
        }
    }



}

