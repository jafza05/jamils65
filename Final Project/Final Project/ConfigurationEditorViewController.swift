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
        
        if presetPoints.count == 0 {
            return max(engine.cols, engine.rows)
        }
        
        else {
        let pointMax = presetPoints.map({ $0.maxElement()!}).maxElement()!
        let newGridDim = Int(floor(Double(pointMax) * 1.5))
        //print(newGridDim)
        return newGridDim
        }
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
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        editCellGrid.setNeedsDisplay()
//        
//        engine.delegate = self
//    }
//    
//    func engineDidUpdate(withGrid: GridProtocol) {
//        editCellGrid.setNeedsDisplay()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblName.text = name
        print(name)
        
        engine.rows = newGridSizer()
        engine.cols = newGridSizer()

        for h in 0..<StandardEngine.sharedInstance.grid.cells.count {               //set all cells to empty
            StandardEngine.sharedInstance.grid.cells[h].state = .Empty
        }
        
        for p in 0..<presetPoints.count {
            let focusPoint: [Int] = presetPoints[p]
            let targetCell = (focusPoint[1]*engine.grid.cols)+focusPoint[0]
            engine.grid.cells[targetCell].state = .Alive
        }
    }
    
    @IBOutlet weak var lblName: UITextField!
    
    @IBAction func saveName(sender: AnyObject) {
        guard let newName = lblName.text,
            let commit = self.commit
            else {
                print("\(#function): Guard fail")
                return
        }
        commit(newName)
        navigationController!.popViewControllerAnimated(true)
    }


}
