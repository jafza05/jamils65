//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


    enum CellState: String {
        case living
        case died
        case born
        case empty
        
        func description() -> String {
            switch self {
            case .living, .died, .born, .empty:
                return self.rawValue
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

CellState.living
CellState.died

var test = [CellState.living, CellState.died]




test[1]

