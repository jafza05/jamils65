//
//  ViewController.swift
//  Assignment3a
//
//  Created by Jamil Afza on 7/8/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    let height: Int = 20
    let width: Int = 20
    
    var beforeArray = [[Bool]](count: 20, repeatedValue: Array(count: 20, repeatedValue: false))
    var afterArray = [[Bool]](count: 20, repeatedValue: Array(count: 20, repeatedValue: false))
    
    var grid = Array(count: 20, repeatedValue: Array(count: 20, repeatedValue: ViewController.CellState.empty))
    
    var touchPoints = [UITouch : [CGPoint]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        

        for h in 0..<height {               //initialize first state of the array
            for w in 0..<width {
                if Int(arc4random_uniform(3)) == 1 {
                    beforeArray [h][w] = true
                }
                else {
                    beforeArray [h][w] = false
                }
            }
        }

        print(beforeArray)

    }
  
    @IBAction func btnIterate(sender: AnyObject) {
        
        
        beforeArray = step2(beforeArray).afterArray     //reiterate the cells
//        GridView.grid = step2(beforeArray).grid         //set the grid for display to the grid outputs generated in the step2 function in the engine
        print(beforeArray)                              //print for reference
        print(step2(beforeArray).grid)                  //print for reference
//        GridView.setNeedsDisplayInRect()                //print for reference
        
    }

    enum CellState: String {
        case living, died, born, empty
        
        func description() -> String {
            switch self {
            case .living, .died, .born, .empty:
                return self.rawValue
            }
        }
        
        
        func allValues() -> [CellState] {
        switch self {
        case .living, .died, .born, .empty:
            return [.living, .died, .born, .empty]
        }
        }
        
 
        func toggle (value: CellState) -> CellState {
            switch self {
            case .living, .born:
                return .empty
            case .died, .empty:
                return .living
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            toggleTouchPoint(touch) //capture beginning touch points
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            toggleTouchPoint(touch) //capture continued touch points
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        processTouches()            //after touching is complete, call function to toggle touched cells
    }
 
    func toggleTouchPoint(touch: UITouch) {
//        let position: CGPoint = touch.locationInView(ViewController)
//        self.touchPoints[touch].append(position)    //store touched points into an array for toggle processing in processTouches
        
    }
    
    func processTouches() {             //evaulate state of touched points and toggle via enum
//        for tp in touchPoints {
//            grid[tp.0,tp.1].toggle() = grid[tp.0,tp.1]
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

