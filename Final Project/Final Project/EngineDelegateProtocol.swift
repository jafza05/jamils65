//
//  EngineDelegateProtocol.swift
//  Final Project
//
//  Created by Jamil Afza on 7/29/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

protocol EngineDelegate: class {
    func engineDidUpdate(withGrid: GridProtocol)
    func engineDidUpdate(withConfigurations: Array<Configuration>)
}

extension EngineDelegate {
    func engineDidUpdate(withConfigurations: Array<Configuration>) {
        // empty default implementation
    }
}