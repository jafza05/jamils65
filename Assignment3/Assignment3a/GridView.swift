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

                grid = Array(count: rows, repeatedValue: Array(count: cols, repeatedValue: ViewController.CellState.empty))
                print("rows changed")
            }
        }
    }
    @IBInspectable var cols: Int = 20 {
        didSet{
            if cols != oldValue {
                grid = Array(count: rows, repeatedValue: Array(count: cols, repeatedValue: ViewController.CellState.empty))
                print("columns changed")
            }
        }
    }

    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.grayColor()
    @IBInspectable var bornColor: UIColor = UIColor.blueColor()
    @IBInspectable var diedColor: UIColor = UIColor.brownColor()
    @IBInspectable var gridColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var gridWidth: CGFloat = 2.0

    
    var grid = Array(count: 20, repeatedValue: Array(count: 20, repeatedValue: ViewController.CellState.empty))
    
    
    override func drawRect(rect: CGRect) {
        
        let gridPath = UIBezierPath()
            
        gridPath.lineWidth = gridWidth
        
        let widthSpacing: CGFloat = bounds.width / CGFloat(cols)
        let heightSpacing: CGFloat = bounds.height / CGFloat(rows)
        
        
        for c in 0...cols {
        
            gridPath.moveToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: bounds.height))
            
            gridPath.addLineToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: 0))
        }
        
        for r in 0...rows {
            gridPath.moveToPoint(CGPoint(
                x: 0,
                y: 0 + heightSpacing * CGFloat(r)))
            
            gridPath.addLineToPoint(CGPoint(
                x: bounds.width,
                y: 0 + heightSpacing * CGFloat(r)))
        }
        
            gridColor.setStroke()
            gridPath.stroke()
        
        
        
        grid[2][2] = ViewController.CellState.living
        grid[7][4] = ViewController.CellState.born
        
        for r in 0..<rows{
            for c in 0..<cols{
                let xPos: CGFloat = CGFloat(c) * widthSpacing
                let yPos: CGFloat = CGFloat(r) * heightSpacing
                let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)

            
                let path = UIBezierPath(ovalInRect: cellRect)
                
                switch grid[r][c] {
                    
                case .living:
                    livingColor.set()
                case .died:
                    diedColor.set()
                case .born:
                    bornColor.set()
                case .empty:
                    emptyColor.set()
                }
 
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
