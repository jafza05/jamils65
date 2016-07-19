//
//  Protocols.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/16/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

protocol EngineProtocol {
    var delegate: EngineDelegate { get set }
    var grid: GridProtocol { get }
    var refreshRate: Double { get set }      //need to initialize this with value 0 using exention
    var refreshTimer: NSTimer { get set }
    var rows: Int { get set }
    var cols: Int { get set }
    func step() -> GridProtocol
    
    init (rows: Int, cols: Int)
    
}

























