//: Playground - noun: a place where people can play

import Foundation

let immutableString = "hello, playground"
var str = "Hello, playground"

str = "another string"

var myInt = 42
let myConstant = 50

let implicitDouble = 7.0
let explicitDouble: Double = 64

let label = "the width is "
let width = 4
let widthLabel = label + String(width)

let numberStr: String = "38"

let strConversion = Double(numberStr)! + 3


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples and \(oranges) oranges"

var shoppingList: Array<Any> = ["catfish", "water", "tulips", "blue paint"]
shoppingList.append("toothpaste")
shoppingList.append(68)


var occupation: Dictionary<String,String> = [
    "malcom": "captain",
    "kalyee": "mechanic"
]

occupation["Jayne"] = "Public Relations"


var occupationNames = occupation.map { $0.0 }
occupationNames





var r = 50...100
var g = r.generate()
g.next()
g.next()

var g1 = [11,21,31,41,51].generate()
g1.next()

var tuple1 = (1,2)
tuple1.0
tuple1.1

var tuple2 = (first:"van", last:"Simmons")
tuple2.0
tuple2.last

for (k,v) in occupation{
    print("\(k),\(v)")
}

func doubler(x:Int) -> Int {
    return x*2
}

doubler(5)

func progression(v:Int, f:Int->Int) -> Int {
    return f(v)
}

progression(4, f:doubler)


var tf = false
tf = true

var arrArr: Array<Array<Bool>> = [[true]]

var arrArr2: Array<Dictionary<Int,Bool>> = [[1:true]]

var closure = { (x:Int) -> Int in
    return x*2

}

closure(6)

progression(6,f:closure)


progression(6) {(x:Int) -> Int in
    return x*2
}


var optionalN:Int? = 12
var implicitOptionalN:Int! = 12

if let n = optionalN {
    let doubleN = doubler(n)
}

doubler(implicitOptionalN)



