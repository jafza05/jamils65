//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/18/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation


class StandardEngine: EngineProtocol {
    
    
     //this is my singleton, i am using StandardEngine.sharedInstance to reference everything in the rest of my files
    private static var _sharedInstance = StandardEngine()      
    static var sharedInstance: StandardEngine {
        get {
            return _sharedInstance
        }
    }
    
    var grid: GridProtocol = Grid.gridArray       //setting the grid in the Standard Engine to the initial CellState grid in the Grid class
    var refreshRate: Double = 0
    var refreshTimer: NSTimer
    var rows: Int
    var cols: Int
    var delegate: EngineDelegate?               //declaring the delegate
    
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
    }
    
    
    
    func step(beforeArray: [[CellState]]) -> (gridCS: [[CellState]]) {
        
        var tempGrid = Array(count: Int(rows), repeatedValue: Array(count: Int(cols), repeatedValue: CellState.empty))
        var targetStatus = false
        
        let height: Int = beforeArray.count
        let width: Int = beforeArray.count
        
        
        /*
         
         My step function takes the grid input as a parameter and checks whether the neighbor is alive via the neighbors function, the switch statement then takes the number of total alive cells and switches based on the rules
         
         */
        
        for h in 0..<rows {
            for w in 0..<cols {
                
                var neighborAliveCount: Int = 0     //counter for how many neighbor cells are alive
                
                targetStatus = false
                
                if tempGrid[h][w] == CellState.living || tempGrid[h][w] == CellState.born
                {
                    targetStatus = true
                }
                
                
                for z in neighbors(h, y: w) {
                    if beforeArray[z.0][z.1] == CellState.living || beforeArray[z.0][z.1] == CellState.born {
                        neighborAliveCount += 1
                    }
                }
                
                
                if tempGrid[h][w] == CellState.living || tempGrid[h][w] == CellState.born {                               //set of conditions if target cell is alive
                    switch neighborAliveCount {
                    case 2,3:                       // cell stays alive
                        tempGrid[h][w] = CellState.living
                        
                    default:                        // cell dies
                        tempGrid[h][w] = CellState.died
                    }
                }
                    
                else {                              //conditions if target cell is not alive
                    switch neighborAliveCount {
                    case 3:                         // cell becomes alive
                        tempGrid[h][w] = CellState.born
                        
                    default:                        // cell stays dead
                        tempGrid[h][w] = CellState.empty
                    }
                }
            }
        }
        
        
        var aliveCount = 0                      //variable for counting alive cells
        
        for h in 0..<height {                   //for loop counting alive cells
            for w in 0..<width {
                if tempGrid[h][w] == CellState.born || tempGrid[h][w] == CellState.living {
                    aliveCount += 1
                }
            }
        }
        
        return (gridCS: tempGrid)
    }
    
    
    
    /*
     this block of code sets up the timer and interval. There is a did set in the InstrumentationVC that will update this if the values are adjusted using the slider, the default on the slider is set to 5.05 hertz
     
     */
    
    private var freqTimer:NSTimer?
    
    var refreshInterval: NSTimeInterval = 0 {
        didSet {
            if refreshInterval != 0 {
                if let freqTimer = freqTimer { freqTimer.invalidate() }
                let sel = #selector(StandardEngine.timerClock(_:))
                freqTimer = NSTimer.scheduledTimerWithTimeInterval(refreshInterval,
                                                                   target: self,
                                                                   selector: sel,
                                                                   userInfo: "check fire",
                                                                   repeats: true)
            }
                
            else if let freqTimer = freqTimer {
                freqTimer.invalidate()
                self.freqTimer = nil
            }
        }
    }
    
    
    @objc func timerClock(timer:NSTimer) {
        //this is supposed to invoke the step function on the grid when the timer fires at the set interval
        step(self.grid)
        let updateNotification = NSNotification(name: "TimerFire",
                               object: nil,
                               userInfo: ["":""])
        NSNotificationCenter.defaultCenter().postNotification(updateNotification)
        
        
    }
    
    func notifyGridChange(grid: GridProtocol) {
        if let delegate = delegate {
            delegate.engineDidUpdate(grid)
        }
    }
    
}