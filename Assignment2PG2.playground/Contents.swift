//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var firstArray = Array(count: 5, repeatedValue: Array(count: 5, repeatedValue: 0))

firstArray [2][2] = 5

firstArray

var height = 5
var width = 5

for h in 0..<height {
    for w in 0..<width {
        firstArray [h][w] = Int(arc4random_uniform(2))
    }
}

firstArray



var alive = 0

for h in 0..<height {
    alive = 0
    if firstArray [h][0] = 1 {
        alive += 1
    }
    
    
}














