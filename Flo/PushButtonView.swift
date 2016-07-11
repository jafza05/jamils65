//
//  PushButtonView.swift
//  Flo
//
//  Created by Jamil Afza on 7/7/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import UIKit

@IBDesignable

class PushButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height)*0.6
        
        var plusPath = UIBezierPath()
        
        plusPath.lineWidth = plusHeight
        
        plusPath.moveToPoint(CGPoint(
            x: bounds.width/2 - plusWidth/2,
            y: bounds.height/2))
        
        plusPath.addLineToPoint(CGPoint(
            x: bounds.width/2 + plusWidth/2,
            y: bounds.height/2))
        
        
        if isAddButton {
            plusPath.moveToPoint(CGPoint(
                x: bounds.width/2,
                y: bounds.height/2 - plusWidth/2))
            
            plusPath.addLineToPoint(CGPoint(
                x: bounds.width/2,
                y: bounds.height/2 + plusWidth/2))
        }
        
        UIColor.whiteColor().setStroke()
        
        plusPath.stroke()
        
        
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
