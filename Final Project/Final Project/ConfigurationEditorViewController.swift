//
//  ConfigurationEditorViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/29/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class ConfigurationEditorViewController: UIViewController {
    
    
    var touchPoints = [UITouch : [CGPoint]]()
    
    @IBOutlet weak var editCellGrid: GridView!
    
    var name: String = ""
    var presetPoints: [[Int]] = [[]]
    var commit: (String -> Void)?
    var engine = StandardEngine.sharedInstance
    
    func newGridSizer() -> Int {
        let pointMax = presetPoints.map({ $0.maxElement()!}).maxElement()!
        let newGridDim = Int(floor(Double(pointMax) * 1.5))
        print(newGridDim)
        return newGridDim
    }
    
    var cols: Int {
        get {
            return newGridSizer()
        }
        set {
            engine.cols = newValue
        }
    }
    
    var rows: Int {
        get {
            return newGridSizer()
        }
        set {
            engine.rows = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblName.text = name
        print(presetPoints)
        
        

        
        
        

        for h in 0..<StandardEngine.sharedInstance.grid.cells.count {               //set all cells to empty
            StandardEngine.sharedInstance.grid.cells[h].state = .Empty
        }
        
        for p in 0..<presetPoints.count {
            let focusPoint: [Int] = presetPoints[p]
            let targetCell = (focusPoint[1]*StandardEngine.sharedInstance.grid.cols)+focusPoint[0]
            StandardEngine.sharedInstance.grid.cells[targetCell].state = .Alive
        }
    }
    
    @IBOutlet weak var lblName: UITextField!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position: CGPoint = touch.locationInView(editCellGrid)
            print(position.x, position.y)
            
            let heightSpacing = editCellGrid.bounds.height / CGFloat(StandardEngine.sharedInstance.rows)
            let widthSpacing = editCellGrid.bounds.width / CGFloat(StandardEngine.sharedInstance.cols)
            
            let tRow = min(max(floor((position.x / (editCellGrid.bounds.width / CGFloat(StandardEngine.sharedInstance.cols)))),0),CGFloat(StandardEngine.sharedInstance.cols)-1)
            let tCol = min(max(floor((position.y / (editCellGrid.bounds.height / CGFloat(StandardEngine.sharedInstance.rows)))),0),CGFloat(StandardEngine.sharedInstance.rows)-1)
            
            print(tRow, tCol)
            let touchedPoint = (Int(tCol)*Int(StandardEngine.sharedInstance.grid.cols))+Int(tRow)
            print(touchedPoint)
            
            let xPos: CGFloat = tRow * widthSpacing
            let yPos: CGFloat = tCol * heightSpacing
            let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
            
            
            let path = UIBezierPath(ovalInRect: cellRect)
            
            switch StandardEngine.sharedInstance.grid.cells[touchedPoint].state {
                
            case .Alive, .Born:
                StandardEngine.sharedInstance.grid.cells[touchedPoint].state = .Empty
            case .Died, .Empty:
                StandardEngine.sharedInstance.grid.cells[touchedPoint].state = .Alive
            }
            
            print(StandardEngine.sharedInstance.grid.cells[touchedPoint].state)
            path.fill()
            
            
            editCellGrid.setNeedsDisplay()
        }
    }

}
