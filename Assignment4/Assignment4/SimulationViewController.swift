//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/14/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {
    
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.lightGrayColor()
    @IBInspectable var bornColor: UIColor = UIColor.blueColor()
    @IBInspectable var diedColor: UIColor = UIColor.brownColor()
    @IBInspectable var gridColor: UIColor = UIColor.blackColor()
    @IBInspectable var gridWidth: CGFloat = 2.0

    @IBAction func buttonIterate(sender: AnyObject) {
        
        StandardEngine.sharedInstance.step(grid)        //button action on the SimVC to invoke the step function and redisplay the cellGrid with the new state of the CellStates
        cellGrid.setNeedsDisplay()
    }

    @IBOutlet weak var cellGrid: GridView!
    override func viewDidLoad() {
        super.viewDidLoad()

        var engineDelegate: EngineDelegate      //setup of the SimulationVC as the delegate for the StandardEngine
        StandardEngine.sharedInstance.delegate = self
        
    }
    
    
    var localGrid : [[CellState]] = StandardEngine.sharedInstance.grid
    
    func drawRect(rect: CGRect) {
        
        let gridPath = UIBezierPath()
        
        gridPath.lineWidth = gridWidth
        
        let heightSpacing: CGFloat = bounds.height / CGFloat(StandardEngine.sharedInstance.rows)  //determine horizontal grid line spacing
        let widthSpacing: CGFloat = bounds.width / CGFloat(StandardEngine.sharedInstance.cols)    //determine vertical gridline spacing
        
        
        for r in 0...StandardEngine.sharedInstance.rows {
            gridPath.moveToPoint(CGPoint(               //draw all the horizontal lines
                x: 0,
                y: 0 + heightSpacing * CGFloat(r)))
            
            gridPath.addLineToPoint(CGPoint(
                x: bounds.width,
                y: 0 + heightSpacing * CGFloat(r)))
        }
        
        for c in 0...StandardEngine.sharedInstance.cols {                             //draw all the vertical lines
            
            gridPath.moveToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: bounds.height))
            
            gridPath.addLineToPoint(CGPoint(
                x: 0 + widthSpacing * CGFloat(c),
                y: 0))
        }
        
        gridColor.setStroke()
        gridPath.stroke()
        
        
        for r in 0..<StandardEngine.sharedInstance.rows{                              //draw circle (oval) in looped squares inside the grid
            for c in 0..<StandardEngine.sharedInstance.cols{
                let xPos: CGFloat = CGFloat(c) * widthSpacing
                let yPos: CGFloat = CGFloat(r) * heightSpacing
                let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
                
                
                let path = UIBezierPath(ovalInRect: cellRect)
                
                switch localGrid[r][c] {    //call grid array to determine which color each cell should be
                    
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

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



