//
//  Engine.swift
//  Assignment2
//
//  Created by Jamil Afza on 7/4/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

func step(beforeArray: [[Bool]]) -> (afterArray:[[Bool]], aliveCells: Int) {
    
    var afterArray = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
    var aboveLine: Int = 0      //variable for the row number of the neighbors above target cell
    var belowLine: Int = 0      //variable for the row number of the neighbors below target cell
    var toLeft: Int = 0         //variable for the column number of the neighbors to the left of the target cell
    var toRight: Int = 0        //variable for the row number of the neighbors to the right of the target cell
    var vNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 vertical neighbor rows of the target cell
    var hNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 horizontal neighbor rows of the target cell
    
    let height: Int = beforeArray.count
    let width: Int = beforeArray.count


    for h in 0..<height {
        for w in 0..<width {
            
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
            
            
            for x in vNeighbors {
                for y in hNeighbors {
                    
                    if (x == h && y == w) {
                        focusStatus = beforeArray[x][y]     //assign whether target cell is alive or dead
                    }
                        
                    else if beforeArray[x][y] == true {
                        neighborAliveCount += 1             //increment alive count if neighbor cell is alive
                    }
                }
            }
        
            if focusStatus {                    //set of conditions if target cell is alive
                switch neighborAliveCount {
                case 2,3:                       // cell stays alive
                    nextState = true
                    
                default:                        // cell dies
                    nextState = false
                }
            }
        
            else {                              //conditions if target cell is not alive
                switch neighborAliveCount {
                case 3:                         // cell becomes alive
                    nextState = true
                    
                default:                        // cell stays dead
                    nextState = false
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

    return (afterArray: afterArray, aliveCells: aliveCount)
        
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
    
    print("\(neighborArray)")
    return neighborArray
    
}


func step2(beforeArray: [[Bool]]) -> (afterArray:[[Bool]], aliveCells: Int) {
    
    var afterArray = [[Bool]](count: 10, repeatedValue: Array(count: 10, repeatedValue: false))
    var nextState: Bool = false
    var targetStatus = false
    
    let height: Int = beforeArray.count
    let width: Int = beforeArray.count
    
    
    for h in 0..<10 {
        for w in 0..<10 {
            
            var neighborAliveCount: Int = 0     //counter for how many neighbor cells are alive
            targetStatus = beforeArray[h][w]
            
            for z in neighbors(h, y: w) {
                if beforeArray[z.0][z.1] == true {
                    neighborAliveCount += 1
                }
            }
            
            if targetStatus {                    //set of conditions if target cell is alive
                switch neighborAliveCount {
                case 2,3:                       // cell stays alive
                    nextState = true
                    
                default:                        // cell dies
                    nextState = false
                }
            }
                
            else {                              //conditions if target cell is not alive
                switch neighborAliveCount {
                case 3:                         // cell becomes alive
                    nextState = true
                    
                default:                        // cell stays dead
                    nextState = false
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
    
    return (afterArray: afterArray, aliveCells: aliveCount)
}


