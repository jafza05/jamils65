//
//  TwoDimensional.swift
//  JPSection2
//
//  Created by Jamil Afza on 6/29/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

enum NeighborStatus {
    case alive
    case dead
    case starved
    case overpopulated
    case reproduced
    
    var isAlive: Bool {
        switch (self) {
        case .alive:
            fallthrough
        case .reproduced:
            return true
            
        case .overpopulated,
             .starved,
             .dead:
            return false
        }
    }
}

class TwoDimensional {
    let height: Int
    let width: Int
    
    let twoDimArrayOfInt : Array<Array<Int>>
    
    init (height: Int, width: Int) {
        self.height = height
        self.width = width
        
        self.twoDimArrayOfInt = Array(count: height,
                                      repeatedValue: Array(count: width, repeatedValue:0))
    }
    
    /* 
    X X X 0 0 
    X T X 0 0 
    X X X 0 0 
    0 0 0 0 0
    0 0 0 0 0
 
 */
    
    /*

}