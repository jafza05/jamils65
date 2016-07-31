//
//  FirstViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        freqLabel.text = ("Frequency \(StandardEngine.sharedInstance.refreshRate) hz")
        //rowLabel.text = ("\(StandardEngine.sharedInstance.grid.rows)")
        colLabel.text = ("\(StandardEngine.sharedInstance.grid.cols)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func rowStepper(sender: UIStepper) {
        rowLabel.text = Int(sender.value).description
        print( ("\(rowStepperOutlet.value)"))
        print("click")
    }

    
    @IBAction func colStepper(sender: AnyObject) {
        print("column clicked")
        
    }

    
    @IBAction func refreshButton(sender: AnyObject) {
        if refreshSwitch.on {
            refreshStatus.text = "On"
        }
        else { refreshStatus.text = "Off"}
    }
    
    @IBAction func freqSlider(sender: AnyObject) {
    }

    
    
    @IBOutlet weak var freqLabel: UILabel!
    @IBOutlet weak var refreshStatus: UILabel!
    @IBOutlet weak var refreshSwitch: UISwitch!
    @IBOutlet weak var rowStepperOutlet: UIStepper!
    @IBOutlet weak var rowLabel: UITextField!
    @IBOutlet weak var colStepperOutlet: UIStepper!
    @IBOutlet weak var colLabel: UITextField!
    
}

