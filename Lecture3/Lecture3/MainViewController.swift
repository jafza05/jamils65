//
//  ViewController.swift
//  Lecture3
//
//  Created by Jamil Afza on 6/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBAction func buttonClicked(sender: AnyObject) {
        print("We were clicked")
        textView.text("We were clicked")
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var myButton: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

