//
//  SimulationViewController2.swift
//  Final Project
//
//  Created by Jamil Afza on 8/2/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

class SimulationViewController2: UIViewController, EngineDelegate {
    
    let engine = StandardEngine.sharedInstance
    
    @IBOutlet weak var gridView: GridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridView.setNeedsDisplay()


    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        gridView.setNeedsDisplay()
        
        engine.delegate = self
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridView.setNeedsDisplay()
    }
    
    func randomize() {
        print("reset to random")
        for h in 0..<engine.grid.cells.count {               //initialize first state of the array
            if Int(arc4random_uniform(3)) == 1 {
                engine.grid.cells[h].state = .Alive
            }
            else {
                engine.grid.cells[h].state = .Empty
            }
        }
        gridView.setNeedsDisplay()
    }
    
    func iterate() {
        engine.step()
    }
    
    
    func reset() {
        for h in 0..<engine.grid.cells.count {               //set all cells to empty
            engine.grid.cells[h].state = .Empty
        }
        print("Reset")
    }
    

    
    @IBAction func btnStart(sender: UIButton) {
        engine.refreshTimer?.invalidate()
        engine.refreshTimer = NSTimer.scheduledTimerWithTimeInterval(engine.refreshRate, target:
            self, selector: #selector(iterate), userInfo: nil, repeats: true)
        print("timer started")
    }
    
    @IBAction func btnStop(sender: UIButton) {
        engine.refreshTimer!.invalidate()
        print("timer stopped")
        
    }
    
    @IBAction func btnReset(sender: AnyObject) {
        reset()
    }
    
    
    @IBAction func btnRandom(sender: AnyObject) {
        randomize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stepButtonPressed(sender: AnyObject) {
        engine.step()
    }
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
