//
//  FirstViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {
    
    let engine = StandardEngine.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        freqLabel.text = ("\(StandardEngine.sharedInstance.refreshRate) hz")
        rowLabel.text = ("\(StandardEngine.sharedInstance.grid.rows)")
        colLabel.text = ("\(StandardEngine.sharedInstance.grid.cols)")
        freqSliderOutlet.value = Float(StandardEngine.sharedInstance.refreshRate)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func rowStepper(sender: UIStepper) {
        engine.rows = Int(sender.value)
        print("row stepper clicked")
        rowLabel.text = String(sender.value)
    }

    
    @IBAction func colStepper(sender: UIStepper) {
        engine.cols = Int(sender.value)
        print("column stepper clicked")
        print(Int(sender.value))
        colLabel.text = String(sender.value)
        
    }

    
    @IBAction func refreshButton(sender: AnyObject) {
        if refreshSwitch.on {
            refreshStatus.text = "On"
        }
        else { refreshStatus.text = "Off"}
    }
    
    @IBAction func freqSlider(sender: AnyObject) {
        freqLabel.text = ("\(round(freqSliderOutlet.value*10)/10) hz")
        engine.refreshRate = Double(1/(round(freqSliderOutlet.value*10)/10))
    }

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

