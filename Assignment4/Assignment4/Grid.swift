//
//  Classes.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/17/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation


class Grid: GridProtocol {
    
    //set the row parameter to the value modified by the user in the Instrumentation VC
    var rows: Int {
        get {
            return InstrumentationViewController.rowStepperOutlet.value
        }
        
        set {
        
        }
    }
    
    
    //set the col parameter to the value modified by the user in the Instrumentation VC
    var cols: Int {
        get {
            return InstrumentationViewController.colStepperOutlet.value
        }
        
        set {
            
        }
    }
    
    //initialize the rows and columns to a default of 10
    init(rows: Int, cols: Int) {            
        self.rows = 10
        self.cols = 10
    }
    
     //this is my array of cellstates that is initialized to all empty based on the rows and columns that user defined. This array gets set to the array in StandardEngine for it to manipulate with the step function and touches. When the Instrumentation controller makes changes to the grid size, it will update and initialize to all empty
    
    private var gridArray: [[CellState]] = [[]]
    
    init (rows: Int, cols: Int) {
        gridArray = Array(count: Int(rows), repeatedValue: Array(count: Int(cols), repeatedValue: CellState.empty))
        }
    
    
    
    
    func neighbors(x: Int, y:Int) -> [(Int,Int)] {
        let height = Int(rows)
        let width = Int(cols)
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
        return neighborArray
    }
    
    //this is my subscript for reading the respective x, y values from the grid parameter and returning the cellstate value
    
    subscript(xSub: Int, ySub: Int, grid: [[CellState]]) -> CellState {
        get {
            return grid[xSub][ySub]
        }
        
        set {
            
        }
    }
        
}

