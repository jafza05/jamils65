//
//  FirstViewController.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/14/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {
    
    /*
     The IB Actions follow the same basic structure for the steppers, slider, and toggle switch
     
     the first line takes the outlet value and set it to the text so the label will show what the current value is
     the second line sets the new value to the StandardEngine sharedInstance variable after the user has engaged with the button
     the third line calls for a redisplay of the cellGrid in the Simulation VC after a row or column variable are changed
 
    */
    
    
    @IBAction func rowStepper(sender: UIStepper) {
        self.rowValLabel.text = "\(rowStepperOutlet.value)"
        StandardEngine.sharedInstance.rows = Int(rowStepperOutlet.value)
        SimulationViewController.cellGrid.setNeedsDisplay()
    }
    @IBOutlet weak var rowStepperOutlet: UIStepper!
    @IBOutlet weak var rowValLabel: UILabel!

    @IBAction func colStepper(sender: UIStepper) {
        self.colValLabel.text = "\(colStepperOutlet.value)"
        StandardEngine.sharedInstance.cols = Int(colStepperOutlet.value)
        SimulationViewController.cellGrid.setNeedsDisplay()
    }
    @IBOutlet weak var colStepperOutlet: UIStepper!
    @IBOutlet weak var colValLabel: UILabel!

    @IBAction func timedSwitch(sender: UISwitch) {
        StandardEngine.sharedInstance.refreshInterval = 0
    }
    
    @IBAction func frequencySlider(sender: UISlider) {
        self.freqValLabel.text = "\(self.freqSliderOutlet.value) hz"
        StandardEngine.sharedInstance.refreshInterval = Double(freqSliderOutlet.value)
    }
    @IBOutlet weak var freqSliderOutlet: UISlider!
    @IBOutlet weak var freqValLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

