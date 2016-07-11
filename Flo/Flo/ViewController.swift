//
//  ViewController.swift
//  Flo
//
//  Created by Jamil Afza on 7/7/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        counterLabel.text = String(counterView.counter)
    }

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func btnPushButton (button:PushButtonView) {
        if button.isAddButton {
            counterView.counter += 1
        }
        else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        
        counterLabel.text = String(counterView.counter)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

