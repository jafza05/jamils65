//
//  Engine.swift
//  Assignment2
//
//  Created by Jamil Afza on 7/4/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

//neighbors is called in step2 (which is actually below this function) which is part of the Problem 4 requirement. This function outputs the neighboring cells of each target cell, which are then evaluated in the step2 function to determine if they area alive and the next state of the target cell

func neighbors(x: Int, y:Int) -> [(Int,Int)] {
    let height = 20
    let width = 20
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



func step2(beforeArray: [[Bool]]) -> (afterArray:[[Bool]], aliveCells: Int, gridCS: [[ViewController.CellState]]) {
    
    var afterArray = Array(count: 20, repeatedValue: Array(count: 20, repeatedValue: false))
    var nextState: Bool = false
    var tempGrid = Array(count: 20, repeatedValue: Array(count: 20, repeatedValue:ViewController.CellState.empty))
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
                    tempGrid[h][w] = ViewController.CellState.living
                    
                default:                        // cell dies
                    nextState = false
                    tempGrid[h][w] = ViewController.CellState.died
                }
            }
                
            else {                              //conditions if target cell is not alive
                switch neighborAliveCount {
                case 3:                         // cell becomes alive
                    nextState = true
                    tempGrid[h][w] = ViewController.CellState.born
                    
                default:                        // cell stays dead
                    nextState = false
                    tempGrid[h][w] = ViewController.CellState.empty
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
    
    return (afterArray: afterArray, aliveCells: aliveCount, gridCS: tempGrid)
}


