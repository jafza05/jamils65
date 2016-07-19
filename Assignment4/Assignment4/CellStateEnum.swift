//
//  CellStateEnum.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/18/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

enum CellState: String {
    case living, died, born, empty
    
    func description() -> String {
        return self.rawValue
    }
    
    
    func allValues() -> [CellState] {
        return [.living, .died, .born, .empty]
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
