//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/18/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation


protocol GridProtocol {
    var rows: UInt { get }
    var cols: UInt { get }
    func neighbors(x: Int, y:Int) -> [(Int,Int)]
    subscript (x: Int, y:Int) -> CellState { get set }
    
    init (rows: UInt, cols: UInt)
}