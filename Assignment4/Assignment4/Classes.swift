//
//  Classes.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/17/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation




class StandardEngine: EngineProtocol {
    
    private static var _sharedInstance = StandardEngine()
    static var sharedInstance: StandardEngine {
        get {
            return _sharedInstance
        }
    }
    
    var grid: GridProtocol
    var refreshRate: Double = 0
    var refreshTimer: NSTimer
    var rows: UInt
    var cols: UInt
    var delegate: EngineProtocol?
    
    
    init(rows: UInt, cols: UInt) {
        self.rows = rows
        self.cols = cols
    }

    func step(beforeArray: [[Bool]]) -> (gridCS: [[CellState]]) {
        
        var afterArray = Array(count: rows, repeatedValue: Array(count: cols, repeatedValue: false))
        var nextState: Bool = false
        var tempGrid = Array(count: rows, repeatedValue: Array(count: cols, repeatedValue: CellState.empty))
        var targetStatus = false
        
        let height: Int = beforeArray.count
        let width: Int = beforeArray.count
        
        
        for h in 0..<20 {
            for w in 0..<20 {
                
                var neighborAliveCount: Int = 0     //counter for how many neighbor cells are alive
                targetStatus = beforeArray[h][w]
                
                for z in neighbors(h, y: w) {
                    if beforeArray[z.0][z.1] == true {
                        neighborAliveCount += 1
                    }
                }
                
                //the follow switch has been appended to also create the grid which is used for drawing the visual grid and their respective cell colors based on the previous state condition. I used the tempGrid and later set the grid to tempGrid, due to issues with calling the GridView.grid directly
                
                //the return of the function has been updated to return the CellState grid
                
                if targetStatus {                    //set of conditions if target cell is alive
                    switch neighborAliveCount {
                    case 2,3:                       // cell stays alive
                        nextState = true
                        tempGrid[h][w] = CellState.living
                        
                    default:                        // cell dies
                        nextState = false
                        tempGrid[h][w] = CellState.died
                    }
                }
                    
                else {                              //conditions if target cell is not alive
                    switch neighborAliveCount {
                    case 3:                         // cell becomes alive
                        nextState = true
                        tempGrid[h][w] = CellState.born
                        
                    default:                        // cell stays dead
                        nextState = false
                        tempGrid[h][w] = CellState.empty
                    }
                }
                
                
                afterArray[h][w] = nextState
            }
        }
        
        
        var aliveCount = 0                      //variable for counting alive cells
        
        for h in 0..<height {                   //for loop counting alive cells
            for w in 0..<width {
                if afterArray[h][w] == true {
                    aliveCount += 1
                }
            }
        }
        
        return (gridCS: tempGrid)
    }
    
    
    private var freqTimer:NSTimer?
    
    var refreshInterval: NSTimeInterval = 0 {
        didSet {
            if refreshInterval != 0 {
                if let freqTimer = freqTimer { freqTimer.invalidate() }
                let sel = #selector(StandardEngine.t(_:)timerClock)
                timer = NSTimer.scheduledTimerWithTimeInterval(refreshInterval,
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
        self.rows += 1
        let center = NSNotificationCenter.defaultCenter()
        let n = NSNotification(name: "TimerFire",
                               object: nil,
                               userInfo: nil)
        center.postNotification(n)

    
}





class Grid: GridProtocol {
    var rows: UInt {
        get {
            return 10
        }
    }
    var cols: UInt {
        get {
            return 10
        }
    }
    

    
    private var gridArray: [[CellState]] = [[]]
    
    init (rows, cols) {
        gridArray = Array(count: Int(rows), repeatedValue: Array(count: Int(cols), repeatedValue: CellState.empty))
        }
    }
    
    
    
    func neighbors(x: Int, y:Int) -> [(Int,Int)] {
        let height = 10
        let width = 10
        var aboveLine: Int = 0      //variable for the row number of the neighbors above target cell
        var belowLine: Int = 0      //variable for the row number of the neighbors below target cell
        var toLeft: Int = 0         //variable for the column number of the neighbors to the left of the target cell
        var toRight: Int = 0        //variable for the row number of the neighbors to the right of the target cell
        var vNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 vertical neighbor rows
        var hNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 horizontal neighbor rows
        
        
        
        switch x {                  //switch statement to determine neighbor rows of target cell
        case 0:
            aboveLine = height - 1
            belowLine = x + 1
        case height-1:
            aboveLine = x - 1
            belowLine = 0
        default:
            aboveLine = x - 1
            belowLine = x + 1
        }
        
        switch y {                 //switch statement to determine neighbor columns of target cell
        case 0:
            toLeft = width - 1
            toRight = y + 1
        case width-1:
            toLeft = y - 1
            toRight = 0
        default:
            toLeft = y - 1
            toRight = y + 1
        }
        
        
        vNeighbors = [aboveLine, x, belowLine]
        hNeighbors = [toLeft, y, toRight]
        
        typealias neighbor = (Int, Int)
        
        var neighborArray: [neighbor] = []
        
        for v in 0..<3 {
            for y in 0..<3 {
                if (v == 1 && y == 1) {     //target cell is not a neighbor
                }
                else {
                    neighborArray.append((vNeighbors[v],hNeighbors[y]))
                }
            }
        }
        //return neighborArray
        return neighborArray
    }
    
    subscript(xSub: Int, ySub: Int, grid: [[CellState]]) -> CellState {
        get {
            return grid[xSub][ySub]
        }
        
}

