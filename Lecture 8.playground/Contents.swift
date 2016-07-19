//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var rows = 10
var cols = 10
typealias Position = (row: Int, col: Int)

typealias CellState = Bool
typealias Cell = (position:Position, alive:CellState)


func neighbors(pos: Position) -> [Position] {
    return offsets.map {
}


var toyGrid = [Cell](count: rows*cols, repeatedValue: ((0,0),false))

for var i in 0..<rows {
    for var j in 0..<cols{
        toyGrid[i*cols+j] = ((i,j), arc4random_uniform(3) == 1)
    }
}

let numCells = rows*cols
for var i in 0..<numCells {
    toyGrid[i] = ((i/cols, i%cols), arc4random_uniform(3) == 1)
}

var grid = (0..<numCells).map {
    (($0/cols, $0%cols), arc4random_uniform(3) == 1) as Cell
}


func countLivingCells(grid: [Cell]) -> Int {
    return grid.reduce(0) { return $1.alive ? $0 + 1 : $0 }
}

countLivingCells(grid)

func countLivingNeighbors(grid: [Cell], cell: Cell) -> Int {
    
}