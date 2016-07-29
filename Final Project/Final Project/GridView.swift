//
//  GridView.swift
//  Assignment3a
//
//  Created by Jamil Afza on 7/8/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    @IBInspectable var rows: Int = 20 {
        didSet{
            if rows != oldValue {
                grid = gridMaker()
                print("rows changed")
            }
        }
    }
    
    @IBInspectable var cols: Int = 20 {
        didSet{
            if cols != oldValue {
                grid = gridMaker()
                print("columns changed")
            }
        }
    }
    
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.lightGrayColor()
    @IBInspectable var bornColor: UIColor = UIColor.blueColor()
    @IBInspectable var diedColor: UIColor = UIColor.brownColor()
    @IBInspectable var gridColor: UIColor = UIColor.blackColor()
    @IBInspectable var gridWidth: CGFloat = 2.0

    func gridMaker() -> [[CellState]] {
        return Array(count: self.rows, repeatedValue: Array(count: self.cols, repeatedValue: CellState.Empty))
    }
    
    var grid : [[CellState]] = [[CellState.Alive]]
    
    override func drawRect(rect: CGRect) {
        
        let gridPath = UIBezierPath()
            
        gridPath.lineWidth = gridWidth

        let heightSpacing: CGFloat = bounds.height / CGFloat(rows)  //determine horizontal grid line spacing
        let widthSpacing: CGFloat = bounds.width / CGFloat(cols)    //determine vertical gridline spacing
        
        
        for r in 0...rows {
            gridPath.moveToPoint(CGPoint(               //draw all the horizontal lines
                x: 0,
                y: 0 + heightSpacing * CGFloat(r)))
            
            gridPath.addLineToPoint(CGPoint(
                x: bounds.width,
                y: 0 + heightSpacing * CGFloat(r)))
        }      
        
        for c in 0...cols {                             //draw all the vertical lines
        
            gridPath.moveToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: bounds.height))
            
            gridPath.addLineToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: 0))
        }
        
            gridColor.setStroke()
            gridPath.stroke()
        
        
        for r in 0..<rows{                              //draw circle (oval) in looped squares inside the grid
            for c in 0..<cols{
                let xPos: CGFloat = CGFloat(c) * widthSpacing
                let yPos: CGFloat = CGFloat(r) * heightSpacing
                let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)

            
                let path = UIBezierPath(ovalInRect: cellRect)
                
                bornColor.set()
          
    
        
                path.fill()
                
            }
        }
    }
    
    
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
