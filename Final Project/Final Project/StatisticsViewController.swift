//
//  SecondViewController.swift
//  Final Project
//
//  Created by Jamil Afza on 7/27/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    let engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var gridView: GridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        engine.delegate = self
        
    }
    
//    func engineDidUpdate(withGrid: GridProtocol) {
//        gridView.setNeedsDisplay()
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
//    }

//    let countAlive = engine.grid.alive
//    let countBorn = engine.grid.born
//    let countDied = engine.grid.died
//    let countEmpty = engine.grid.empty
}

