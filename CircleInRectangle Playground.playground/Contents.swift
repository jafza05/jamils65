//: Playground - noun: a place where people can play

import UIKit
import Foundation
import CoreGraphics


class GridView : UIView {
    var rectColor:UIColor = UIColor.blueColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        let centerRect = CGRectMake(x,y,w,h)
        
        let c = UIGraphicsGetCurrentContext()
        
        CGContextAddRect(c, centerRect)
        CGContextSetStrokeColorWithColor(c , UIColor.redColor().CGColor)
        CGContextSetLineWidth(c,4.0)
        CGContextStrokePath(c)
        CGContextSetFillColorWithColor(c, rectColor.CGColor)
        CGContextFillRect(c, centerRect)
    }
}

let perimeter:CGFloat = 800.0
let outerSize = CGSizeMake(perimeter, perimeter)
let rect = CGRectMake(outerSize.width*0.125, outerSize.height*0.125,
                      outerSize.width*0.75, outerSize.height*0.75)

let superview = UIView(frame: CGRectMake(0, 0, 500, 500))

superview.setNeedsDisplay()


    var fillColor: UIColor = UIColor.greenColor()

var frameRect = CGRect(x: 0, y: 0, width: 100, height: 100)

    let path = UIBezierPath(ovalInRect: frameRect)
    fillColor.setFill()
    path.fill()


enum CellState: String {
    case living
    case died
    case born
    case empty
    
    func setColor() -> String {
        switch self {
        case living:
            return "livingColor"
        case died:
            return "diedColor"
        case born:
            return "bornColor"
        case empty:
            return "emptyColor"
        }
        
    }
    
    func description() -> String {
        switch self {
        case .living, .died, .born, .empty:
            return self.rawValue
        }
    }
    
    /*
     func allValues() -> Array[String] {
     for CellState.RawValue {
     
     }
     }
     */
    
    func toggle (value: CellState) -> CellState {
        switch self {
        case .living, .born:
            return .empty
        case .died, .empty:
            return .living
        }
    }
}

    var grid = Array(count: 20, repeatedValue: Array(count: 20, repeatedValue: CellState.empty.setColor()))


for r in 0...4{
    for c in 0...4{
        var state = grid[r][c]
    }
}

