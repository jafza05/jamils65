//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class TwoDimensional {
    let height: Int
    let width: Int
    
    let twoDimArrayOfInt : Array<Array<Int>>
    
    init (height: Int, width: Int) {
        self.height = height
        self.width = width
        
        self.twoDimArrayOfInt = Array(count: height,
                                      repeatedValue: Array(count: width, repeatedValue:0))
        print(twoDimArrayOfInt)
}
}


var test = Int(arc4random_uniform(3))
var test2 = Int(arc4random_uniform(3))
var test3 = Int(arc4random_uniform(3))



var arr = Array(count: 3, repeatedValue: Array(count: 2, repeatedValue: 0))



