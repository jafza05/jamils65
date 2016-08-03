////
////  ViewController.swift
////  Assignment3a
////
////  Created by Jamil Afza on 7/8/16.
////  Copyright © 2016 Jamil Afza. All rights reserved.
////
//
//import UIKit
//
//
//class ViewController: UIViewController {
//
//    
//    let height: Int = 20
//    let width: Int = 20
//    
//    var beforeArray = [[Bool]](count: 20, repeatedValue: Array(count: 20, repeatedValue: false))
//    var afterArray = [[Bool]](count: 20, repeatedValue: Array(count: 20, repeatedValue: false))
//    
//    //var grid = Array(count: 20, repeatedValue: Array(count: 20, repeatedValue: ViewController.CellState.empty))
//    
//    var touchPoints = [UITouch : [CGPoint]]()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    
//        
//
//        for h in 0..<height {               //initialize first state of the array
//            for w in 0..<width {
//                if Int(arc4random_uniform(3)) == 1 {
//                    beforeArray [h][w] = true
//                }
//                else {
//                    beforeArray [h][w] = false
//                }
//            }
//        }
//
//        print(beforeArray)
//
//    }
//    /*
//  
//    @IBAction func bttnIterate(sender: AnyObject) {
//        
//        
//        beforeArray = step2(beforeArray).afterArray     //iterate the cells
//        cellGrid.grid = step2(beforeArray).gridCS
//        cellGrid.setNeedsDisplay()
//        
//    }
//*/
//    
//    @IBOutlet weak var cellGrid: GridView!
//    
//    enum CellState: String {
//        case living, died, born, empty
//        
//        func description() -> String {
//            switch self {
//            case .living, .died, .born, .empty:
//                return self.rawValue
//            }
//        }
//        
//        
//        func allValues() -> [CellState] {
//        switch self {
//        case .living, .died, .born, .empty:
//            return [.living, .died, .born, .empty]
//        }
//        }
//        
// 
//        func toggle (value: CellState) -> CellState {
//            switch self {
//            case .living, .born:
//                return .empty
//            case .died, .empty:
//                return .living
//            }
//        }
//    }
//    
//    
//
//
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch = touches.first {
//            let position :CGPoint = touch.locationInView(cellGrid)
//            print(position.x, position.y)
//            
//            let heightSpacing = cellGrid.bounds.height / CGFloat(cellGrid.rows)
//            let widthSpacing = cellGrid.bounds.width / CGFloat(cellGrid.cols)
//            
//            let tRow = min(max(floor((position.x / (cellGrid.bounds.width / CGFloat(cellGrid.cols)))),0),CGFloat(cellGrid.cols)-1)
//            let tCol = min(max(floor((position.y / (cellGrid.bounds.height / CGFloat(cellGrid.rows)))),0),CGFloat(cellGrid.rows)-1)
//            
//            //the min and max business is to prevent app crash if you click outside of the view
//
//            print(tRow, tCol)
//            
//            let xPos: CGFloat = tRow * widthSpacing
//            let yPos: CGFloat = tCol * heightSpacing
//            //let cellRect = CGRect(x: xPos, y: yPos, width: widthSpacing, height: heightSpacing)
//            
//            
//            //let path = UIBezierPath(ovalInRect: cellRect)
//            
//            //print("\(cellGrid.grid[Int(tRow)][Int(tCol)])")
//            
// /*
//            I could not get the cell to change color after clicking it. I will continue to work on this but I am hoping for some partial credit for being able to identify the cell that was clicked, invoke the toggle, and pass into the switch for color state
// 
//            var toggledState: CellState = cellGrid.grid[Int(tRow)][Int(tCol)].toggle()
//
//            switch toggledState {
//                
//            case .empty, .died:
//                cellGrid.livingColor.set()
//            case .living, .born:
//                cellGrid.emptyColor.set()
//                
//            }
//            
//            path.fill()
// */
//        }
//    }
//        
//            
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
