//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array: [String] = []
var mapArray: [String] = ["1","2","3","4"]


for i in 0..<4 {
    array.append("x\(i)")
}

array


let fullArray = mapArray.map{ "x\($0)" }

fullArray


var testArray = [1,0,1,1,0]

testArray = testArray.map { _ in 0 }

testArray



@IBAction func loadJSON(sender: AnyObject) {
    
    if jsonString.text!.isEmpty  {
        print("No JSON")
    }
        
    else {
        print(jsonString.text)
        let userJSON = NSURL(fileURLWithPath: jsonString!.text!)
        engine.loadConfigurations("\(userJSON)")
    }
}


@IBOutlet weak var freqSliderOutlet: UISlider!
@IBOutlet weak var freqLabel: UILabel!
@IBOutlet weak var refreshStatus: UILabel!
@IBOutlet weak var refreshSwitch: UISwitch!
@IBOutlet weak var rowLabel: UITextField!
@IBOutlet weak var colLabel: UITextField!
@IBOutlet weak var colStepper: UIStepper!
@IBOutlet weak var rowStepper: UIStepper!
@IBOutlet weak var jsonString: UITextField!
}
