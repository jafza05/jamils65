//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var currentState = Array(count: 5, repeatedValue: Array(count: 5, repeatedValue: 0))

currentState [2][2] = 5

currentState

var height = 5
var width = 5

for h in 0..<height {
    for w in 0..<width {
        currentState [h][w] = Int(arc4random_uniform(2))
    }
}

currentState



enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}

House.Stark.rawValue
House.Stark.hashValue

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

Planet.Jupiter.rawValue
Planet.Jupiter.hashValue

var alive = 0
var right = 0
var left = 0

for h in 0..<height {
    for w in 0..<width{
        alive = 0
        
        if w == 4 {
            var right = 0
        }
        else {
            var right = w+1
        }
        
        if w == 0 {
            var left = 4
        }
        else {
            var left = w-1
        }
        
        var checkPoint = currentState[h][right]
        if checkPoint == 1 {
            alive += 1
            print("Cell \(h),\(w) checking \(right)" )

        }
        var checkpoint = currentState[h][left]
        if checkpoint == 1 {
            alive += 1
        }
        print("Cell \(h),\(w) has \(alive) alive neighbors")
}
}




var isPrevAlive: Bool = false
var switchTest = 1
var nextState: Bool = false


if isPrevAlive {
    switch switchTest {
    case 2,3:
        print("cell stays alive")
        nextState = true
        
    default:
        print("cell dies")
        nextState = false
    }
}

else {
    switch switchTest {
    case 3:
        print("cell becomes alive")
        nextState = true
        
    default:
        print("cell stays dead")
        nextState = false
    }
}

nextState











