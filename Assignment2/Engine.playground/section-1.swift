

func neighbors(x: Int) -> [(Int,Int)] {
    var height = 10
    var width = 10
    var aboveLine: Int = 0      //variable for the row number of the neighbors above target cell
    var belowLine: Int = 0      //variable for the row number of the neighbors below target cell
    var toLeft: Int = 0         //variable for the column number of the neighbors to the left of the target cell
    var toRight: Int = 0        //variable for the row number of the neighbors to the right of the target cell
    var vNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 vertical neighbor rows
    var hNeighbors = [Int] (count: 3, repeatedValue: 0)     //matrix for the 3 horizontal neighbor rows

    


    
    

    switch x {                          //switch statement to determine neighbor rows of target cell
    case 0:
        aboveLine = height - 1
        belowLine = x + 1
    case height-1:
        aboveLine = x - 1
        belowLine = 0
    default:
        aboveLine = x - 1
        belowLine = x + 1
    }
    
    vNeighbors = [aboveLine, x, belowLine]
    
    
    typealias neighbor = (Int, Int)
    
    var neighborArray: [neighbor] = []
    
    for v in 0..<3 {
        neighborArray.append((vNeighbors[v],1))
        neighborArray.append((vNeighbors[v],2))
        neighborArray.append((vNeighbors[v],3))
        
    }
    

    
    /*
    
    switch w {                          //switch statement to determine neighbor columns of target cell
    case 0:
        toLeft = width - 1
        toRight = w + 1
    case width-1:
        toLeft = w - 1
        toRight = 0
    default:
        toLeft = w - 1
        toRight = w + 1
        
    */
    
    print("\(neighborArray)")
    return neighborArray
    
}

neighbors(9)

