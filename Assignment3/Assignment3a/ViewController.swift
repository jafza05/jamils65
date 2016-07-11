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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
          }
    
    
    func initialArray() -> [[Bool]] {
        for h in 0..<height {
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
        return(beforeArray)
    }
    
  

    enum CellState: String {
        case living
        case died
        case born
        case empty
        
        
        func colorSet() -> UIColor {
            switch self {
            case .living:
                return UIColor.blackColor()
            default:
                return UIColor.greenColor()
            }
        }
        
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
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

