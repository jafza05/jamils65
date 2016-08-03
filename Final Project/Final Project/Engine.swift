//
//  StandardEngine.swift
//  Final Project
//
//  Created by Jamil Afza on 7/29/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

enum CellState {
    case Empty
    case Died
    case Born
    case Alive
    
    func isLiving() -> Bool {
        switch self {
        case .Alive, .Born: return true
        case .Died, .Empty: return false
        }
    }
}

class StandardEngine: EngineProtocol {
    
    private static var _sharedInstance: StandardEngine = StandardEngine(20,20)
    static var sharedInstance: StandardEngine { get { return _sharedInstance } }
    
//    var configurations: [Configuration] = [] {
//        didSet {
//            if let delegate = delegate { delegate.engineDidUpdate(configurations) }
//        }
//    }

    var configurationIndex: Int?
    var configuration: Configuration? {
        get {
            if delegate is ConfigurationEditorViewController {
                return configurations[configurationIndex!]
            }
            return nil
        }
        set {
            if delegate is ConfigurationEditorViewController {
                configurations[configurationIndex!] = newValue!
            }
        }
    }
    var configurations:Array<Configuration> = [] {
        didSet {
            if let delegate = self.delegate { delegate.engineDidUpdate(self.configurations) }
        }
    }
    
    func loadConfigurations(urlString: String) {
        let url = NSURL(string: urlString)!
        let fetcher = Fetcher()
        fetcher.requestJSON(url) { (json, message) in
            if let json = json, array = json as? Array<Dictionary<String,AnyObject>> {
                
                self.configurations = array.map({ (dict) -> Configuration in
                    return Configuration.fromJSON(dict)
                })
                
                let op = NSBlockOperation {
                    if let delegate = self.delegate { delegate.engineDidUpdate(self.configurations) }
                }
                NSOperationQueue.mainQueue().addOperation(op)
            }
        }
    }
    
    func updateGridBasedOnConfiguration() {
        if let configuration = configuration {
            let newGrid = Grid(rows, cols) { position in
                return configuration.positions.contains({ return position.row == $0.row && position.col == $0.col }) ? .Alive : .Empty
            }
            
            grid = newGrid
        }
    }
    
    
    var grid: GridProtocol {
        didSet {
            if let delegate = delegate { delegate.engineDidUpdate(grid) }
        }
    }
    
    var rows: Int = 20 {
        didSet {
            grid = Grid(self.rows, self.cols) { _,_ in .Empty }
            if let delegate = delegate { delegate.engineDidUpdate(grid) }
        }
    }
    
    var cols: Int = 20 {
        didSet {
            grid = Grid(self.rows, self.cols) { _,_ in .Empty }
            if let delegate = delegate { delegate.engineDidUpdate(grid) }
        }
    }
    
    weak var delegate: EngineDelegate?
    
    var refreshRate:  Double = 0.2
    var refreshTimer: NSTimer?
    
    subscript (i:Int, j:Int) -> CellState {
        get {
            return grid.cells[i*cols+j].state
        }
        set {
            grid.cells[i*cols+j].state = newValue
        }
    }
    
    init(_ rows: Int, _ cols: Int, cellInitializer: CellInitializer = {_ in .Empty }) {
        self.rows = rows
        self.cols = cols
        self.grid = Grid(rows,cols, cellInitializer: cellInitializer)
    }
    
    func step() -> GridProtocol {
        let newGrid = Grid(self.rows, self.cols)
        newGrid.cells = grid.cells.map {
            switch grid.livingNeighbors($0.position) {
            case    2 where $0.state.isLiving(),
                    3 where $0.state.isLiving():  return Cell($0.position, .Alive)
            case    3 where !$0.state.isLiving(): return Cell($0.position, .Born)
            case    _ where $0.state.isLiving():  return Cell($0.position, .Died)
            default:                           return Cell($0.position, .Empty)
            }
        }
        grid = newGrid
        return grid
    }
}
