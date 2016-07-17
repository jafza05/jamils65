//
//  Protocols.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/16/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

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


protocol GridProtocol {
    //var rows: UInt { get }
    //var cols: UInt { get }
    //func neighbors(x: Int, y:Int) -> [(Int,Int)]
    subscript (x: Int, y:Int) -> CellState { get }
    
    //init (rows: UInt, cols: UInt)
}

protocol EngineDelegate {
    func engineDidUpdate(grid: GridProtocol)
}

protocol EngineProtocol {
    var delegate: EngineDelegate? {get set}
    var grid: GridProtocol { get set }
    var refreshRate: Double { get set }
    var refreshTimer: NSTimer { get set }
    var rows: UInt { get set }
    var cols: UInt { get set }
    func step() -> GridProtocol
    
    init (rows: UInt, cols: UInt)
    
}

























