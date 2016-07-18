//
//  FirstViewController.swift
//  Assignment4
//
//  Created by Jamil Afza on 7/14/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {
    
    
    @IBAction func rowStepper(sender: UIStepper) {
        self.rowValLabel.text = "\(rowStepperOutlet.value)"
        StandardEngine.sharedInstance.rows = rowStepperOutlet.value
        SimulationViewController.cellGrid.setNeedsDisplay()
    }
    @IBOutlet weak var rowStepperOutlet: UIStepper!
    @IBOutlet weak var rowValLabel: UILabel!

    @IBAction func colStepper(sender: UIStepper) {
        self.colValLabel.text = "\(colStepperOutlet.value)"
        StandardEngine.sharedInstance.cols = colStepperOutlet.value
        SimulationViewController.cellGrid.setNeedsDisplay()
    }
    @IBOutlet weak var colStepperOutlet: UIStepper!
    @IBOutlet weak var colValLabel: UILabel!

    @IBAction func timedSwitch(sender: UISwitch) {
    }
    
    @IBAction func frequencySlider(sender: UISlider) {
        self.freqValLabel.text = "\(self.freqSliderOutlet.value) hz"
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

