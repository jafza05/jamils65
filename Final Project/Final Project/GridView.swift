//
//  GridView.swift
//  Assignment3a
//
//  Created by Jamil Afza on 7/8/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {

    let engine = StandardEngine.sharedInstance
    
    
    var rows: Int {
        get {
            return engine.rows
        }
        
        set {
            engine.rows = newValue
        }
    }

    
    var cols: Int {
        get {
            return engine.cols
        }
        
        set {
            engine.cols = newValue
        }
    }
    
    var grid: GridProtocol {
        get {
            return engine.grid
        }
        
        set {
            engine.grid = newValue
        }
    }

    
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

        let heightSpacing: CGFloat = bounds.height / CGFloat(rows)  //determine horizontal grid line spacing
        let widthSpacing: CGFloat = bounds.width / CGFloat(cols)    //determine vertical gridline spacing
        
        
        for r in 0...rows {   //draw all the horizontal lines
            gridPath.moveToPoint(CGPoint(
                x: 0,
                y: 0 + heightSpacing * CGFloat(r)))
            
            gridPath.addLineToPoint(CGPoint(
                x: bounds.width,
                y: 0 + heightSpacing * CGFloat(r)))
        }      
        
        for c in 0...cols {   //draw all the vertical lines
        
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
        let totalCells = grid.cells.count
        let rows1 = rows

        for p in 0..<totalCells{                              //draw circle (oval) in looped squares inside the grid
                let xPos: CGFloat = CGFloat(p % rows1) * widthSpacing
                let yPos: CGFloat = floor(CGFloat(p / rows1)) * heightSpacing
                let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
                let path = UIBezierPath(ovalInRect: cellRect)
                
                //print(p % rows1, xPos, floor(CGFloat(p / rows1)), yPos)
            
            
            switch grid.cells[p].state {
            
            case .Alive:
                livingColor.set()
            case .Died:
                diedColor.set()
            case .Born:
                bornColor.set()
            case .Empty:
                emptyColor.set()
            }
                //print(grid.cells[p].state)
                path.fill()
            
        }
    
    }
    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(self)
            print(position.x, position.y)
            
            let heightSpacing = self.bounds.height / CGFloat(rows)
            let widthSpacing = self.bounds.width / CGFloat(cols)
            
            let tRow = min(max(floor((position.x / (self.bounds.width / CGFloat(cols)))),0),CGFloat(cols)-1)
            let tCol = min(max(floor((position.y / (self.bounds.height / CGFloat(rows)))),0),CGFloat(rows)-1)
            
            //the min and max is to prevent app crash if you click outside of the view
            
            print(tRow, tCol)
            let touchedPoint = (Int(tCol)*Int(cols))+Int(tRow)
            print(touchedPoint)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            switch grid.cells[touchedPoint].state {
                
            case .Alive, .Born:
                grid.cells[touchedPoint].state = .Empty
            case .Died, .Empty:
                grid.cells[touchedPoint].state = .Alive
            }
            
            path.fill()
            
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(self)
            print(position.x, position.y)
            
            let heightSpacing = self.bounds.height / CGFloat(rows)
            let widthSpacing = self.bounds.width / CGFloat(cols)
            
            let tRow = min(max(floor((position.x / (self.bounds.width / CGFloat(cols)))),0),CGFloat(cols)-1)
            let tCol = min(max(floor((position.y / (self.bounds.height / CGFloat(rows)))),0),CGFloat(rows)-1)
            
            //the min and max is to prevent app crash if you click outside of the view
            
            print(tRow, tCol)
            let touchedPoint = (Int(tCol)*Int(cols))+Int(tRow)
            print(touchedPoint)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            switch grid.cells[touchedPoint].state {
                
            case .Alive, .Born:
                grid.cells[touchedPoint].state = .Empty
            case .Died, .Empty:
                grid.cells[touchedPoint].state = .Alive
            }
            
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
