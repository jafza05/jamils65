//
//  SecondViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var beforeArray = StandardEngine.sharedInstance.grid.cells
    
    var touchPoints = [UITouch : [CGPoint]]()
    
    var engine = StandardEngine.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //StandardEngine.sharedInstance.grid.rows = 50
        
    }
    
    override func viewDidAppear(animated: Bool) {
        cellGrid.setNeedsDisplay()
    }
    
    override func viewWillDisappear(animated: Bool) {
        engine.refreshTimer?.invalidate()
        print("timer stopped")
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        cellGrid.setNeedsDisplay()
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
        engine.grid.cells = beforeArray
        cellGrid.setNeedsDisplay()
    }
    
    func iterate() {
        print("Iterate called")
        engine.step()
        cellGrid.setNeedsDisplay()
    }
    
    
    func reset() {
//        for h in 0..<engine.grid.cells.count {               //set all cells to empty
//            engine.grid.cells[h].state = .Empty
//        }
//        
        print(engine.grid.cells)
        
        //engine.grid.cells = cellStates.map { _ in .Empty }
        
        print("Reset")
        cellGrid.setNeedsDisplay()
    }
    
    @IBAction func btnIterate(sender: AnyObject) {
        iterate()
    }
    
    @IBAction func btnStart(sender: UIButton) {
        engine.refreshTimer?.invalidate()
        engine.refreshTimer = NSTimer.scheduledTimerWithTimeInterval(engine.refreshRate, target:
                                                                self, selector: #selector(iterate), userInfo: nil, repeats: true)
        print("timer started")
    }
    
    @IBAction func btnStop(sender: UIButton) {
        engine.refreshTimer!.invalidate()
        print("timer stopped")
        
    }
    
    @IBAction func btnReset(sender: AnyObject) {
        reset()
    }

    
    @IBAction func btnRandom(sender: AnyObject) {
        randomize()
    }

    @IBOutlet weak var cellGrid: GridView!
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(cellGrid)
            print(position.x, position.y)
            
            let heightSpacing = cellGrid.bounds.height / CGFloat(engine.rows)
            let widthSpacing = cellGrid.bounds.width / CGFloat(StandardEngine.sharedInstance.cols)
            
            let tRow = min(max(floor((position.x / (cellGrid.bounds.width / CGFloat(engine.cols)))),0),CGFloat(engine.cols)-1)
            let tCol = min(max(floor((position.y / (cellGrid.bounds.height / CGFloat(engine.rows)))),0),CGFloat(engine.rows)-1)
            
            //the min and max is to prevent app crash if you click outside of the view
            
            print(tRow, tCol)
            let touchedPoint = (Int(tCol)*Int(engine.grid.cols))+Int(tRow)
            print(touchedPoint)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            switch engine.grid.cells[touchedPoint].state {
                
            case .Alive, .Born:
                engine.grid.cells[touchedPoint].state = .Empty
            case .Died, .Empty:
                engine.grid.cells[touchedPoint].state = .Alive
            }
            
            path.fill()
            print("touch redisplay")
            cellGrid.setNeedsDisplay()
            
        }
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(cellGrid)
            print(position.x, position.y)
            
            let heightSpacing = cellGrid.bounds.height / CGFloat(engine.rows)
            let widthSpacing = cellGrid.bounds.width / CGFloat(StandardEngine.sharedInstance.cols)
            
            let tRow = min(max(floor((position.x / (cellGrid.bounds.width / CGFloat(engine.cols)))),0),CGFloat(engine.cols)-1)
            let tCol = min(max(floor((position.y / (cellGrid.bounds.height / CGFloat(engine.rows)))),0),CGFloat(engine.rows)-1)
            
            //the min and max is to prevent app crash if you click outside of the view
            
            print(tRow, tCol)
            let touchedPoint = (Int(tCol)*Int(engine.grid.cols))+Int(tRow)
            print(touchedPoint)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            switch engine.grid.cells[touchedPoint].state {
                
            case .Alive, .Born:
                engine.grid.cells[touchedPoint].state = .Empty
            case .Died, .Empty:
                engine.grid.cells[touchedPoint].state = .Alive
            }
            
            path.fill()
            print("touch redisplay")
            cellGrid.setNeedsDisplay()
            
        }
    }


}

