import UIKit

typealias Position = (row:Int, col: Int)

typealias Cell = (position: Position, state: CellState)

typealias CellInitializer = (Position) -> CellState     //this is a closure


class Grid: GridProtocol {
    private(set) var rows: Int
    private(set) var cols: Int
    var cells: [Cell]
    
    var living: Int { return cells.reduce(0) { return  $1.state.isLiving() ?  $0 + 1 : $0 } }
    var dead:   Int { return cells.reduce(0) { return !$1.state.isLiving() ?  $0 + 1 : $0 } }
    //var alive:  Int { return cells.reduce(0) { return  $1.state == .Alive  ?  $0 + 1 : $0 } }
    //var born:   Int { return cells.reduce(0) { return  $1.state == .Born   ?  $0 + 1 : $0 } }
    //var died:   Int { return cells.reduce(0) { return  $1.state == .Died   ?  $0 + 1 : $0 } }
    //var empty:  Int { return cells.reduce(0) { return  $1.state == .Empty  ?  $0 + 1 : $0 } }
    
    var alive: Int = 3
    var born: Int = 4
    var died: Int = 5
    var empty: Int = 6
    
    
    init (_ rows: Int, _ cols: Int, cellInitializer: CellInitializer = {_ in .Empty }) {
        self.rows = rows
        self.cols = cols
        self.cells = (0..<rows*cols).map {
            let pos = Position($0/cols, $0%cols)
            return Cell(pos, cellInitializer(pos))
        }
    }
    
    subscript (i:Int, j:Int) -> CellState {
        get {
            return cells[i*cols+j].state
        }
        set {
            cells[i*cols+j].state = newValue
        }
    }
    
    private static let offsets:[Position] = [
        (-1, -1), (-1, 0), (-1, 1),
        ( 0, -1),          ( 0, 1),
        ( 1, -1), ( 1, 0), ( 1, 1)
    ]
    func neighbors(pos: Position) -> [Position] {
        return Grid.offsets.map { Position((pos.row + rows + $0.row) % rows,
            (pos.col + cols + $0.col) % cols) }
    }

    func livingNeighbors(position: Position) -> Int {
        return neighbors(position)
            .reduce(0) {
                self[$1.row,$1.col].isLiving() ? $0 + 1 : $0
        }
    }
}




