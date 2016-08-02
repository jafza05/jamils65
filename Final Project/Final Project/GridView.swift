//
//  GridView.swift
//  Assignment3a
//
//  Created by Jamil Afza on 7/8/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    @IBInspectable var rows: Int = 10
        {
        didSet{
            if rows != oldValue {
                //StandardEngine.sharedInstance.grid
                print("rows changed")
            }
        }
    }
    
    @IBInspectable var cols: Int = 10
//        {
//        didSet{
//            if cols != oldValue {
//                grid = gridMaker()
//                print("columns changed")
//            }
//        }
//    }
    
    @IBInspectable var livingColor: UIColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
    @IBInspectable var emptyColor: UIColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    @IBInspectable var bornColor: UIColor = UIColor(red: 197/255, green: 179/255, blue: 88/255, alpha: 1)
    @IBInspectable var diedColor: UIColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1)
    @IBInspectable var gridColor: UIColor = UIColor.blackColor()
    @IBInspectable var gridWidth: CGFloat = 0.0
    
    
    var points: [[Int]] = [[]]
    
    override func drawRect(rect: CGRect) {
        
        let gridPath = UIBezierPath()
            
        gridPath.lineWidth = gridWidth

        let heightSpacing: CGFloat = bounds.height / CGFloat(StandardEngine.sharedInstance.rows)  //determine horizontal grid line spacing
        let widthSpacing: CGFloat = bounds.width / CGFloat(StandardEngine.sharedInstance.cols)    //determine vertical gridline spacing
        
        
        for r in 0...StandardEngine.sharedInstance.rows {   //draw all the horizontal lines
            gridPath.moveToPoint(CGPoint(
                x: 0,
                y: 0 + heightSpacing * CGFloat(r)))
            
            gridPath.addLineToPoint(CGPoint(
                x: bounds.width,
                y: 0 + heightSpacing * CGFloat(r)))
        }      
        
        for c in 0...StandardEngine.sharedInstance.cols {   //draw all the vertical lines
        
            gridPath.moveToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: bounds.height))
            
            gridPath.addLineToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: 0))
        }
        
            gridColor.setStroke()
            gridPath.stroke()
        
        //print(StandardEngine.sharedInstance.rows*StandardEngine.sharedInstance.cols)
        print("gridview  redisplay")
        let totalCells = StandardEngine.sharedInstance.grid.cells.count
        let rows1 = StandardEngine.sharedInstance.rows

        for p in 0..<totalCells{                              //draw circle (oval) in looped squares inside the grid
                let xPos: CGFloat = CGFloat(p % rows1) * widthSpacing
                let yPos: CGFloat = floor(CGFloat(p / rows1)) * heightSpacing
                let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
                let path = UIBezierPath(ovalInRect: cellRect)
                
                //print(p % rows1, xPos, floor(CGFloat(p / rows1)), yPos)
            
            
            switch StandardEngine.sharedInstance.grid.cells[p].state {
            
            case .Alive:
                livingColor.set()
            case .Died:
                diedColor.set()
            case .Born:
                bornColor.set()
            case .Empty:
                emptyColor.set()
            }
                //print(StandardEngine.sharedInstance.grid.cells[p].state)
                path.fill()
            
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
