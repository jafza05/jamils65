//: Playground - noun: a place where people can play

import UIKit
import Foundation
import CoreGraphics



var str = "Hello, playground"


enum Color : String {
    case red
    case orange
    case yellow
    case green
    case blue
    case violet
    
    /// Color associated with the enum value
    var color : UIColor {
        switch (self) {
        case .red:
            return UIColor.redColor()
        case .orange:
            return UIColor.orangeColor()
        case .yellow:
            return UIColor.yellowColor()
        case .green:
            return UIColor.greenColor()
        case .blue:
            return UIColor.blueColor()
        case .violet:
            return UIColor.purpleColor()
        }
    }
}

Color.orange
Color.RawValue.self

/*
enum CellState {
    enum dead
    case reproduction
    case starvation
    case alive
    case overcrowding
    
    var isDead: Bool {
        switch (self) {
            case .dead
                 .starvation
                 .overcrowding
            
            
        }
    }
}
 */




class myClass {
    var height : Int
    var width : Int
    
    init(myHeight: Int, myWidth: Int) {
        height = myHeight
        width = myWidth
    }
    
    func description() -> String {
        return("h\(height) w\(width)")
    }
    
let mc15 = myClass(myHeight: 1, myWidth: 5)

print ("\(mc15.height)")
print(mc15.)








