//
//  DrawRectangleView.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DrawRectangleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // It is automatically called when it becomes necessary to update the display.
    override func draw(_ rect: CGRect) {
        // Setting of view.
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        // Generate a rectangular UIBezierPath.
        let rect1: UIBezierPath = UIBezierPath(rect: CGRect(x: 5, y: 5, width: 290, height: 290))
        
        // Set the line color to blue.
        UIColor.blue.setStroke()
        
        // Set the thickness of the line.
        rect1.lineWidth = 1.0
        
        // Drawing.
        rect1.stroke()
        
        // Generate round rectangular UIBezierPath.
        let rect2: UIBezierPath = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 200, height: 100),
            // Round all the corners.
            byRoundingCorners: UIRectCorner.allCorners,
            // Set the degree to round.
            cornerRadii: CGSize(width: 5.0, height: 5.0))
        
        // Set the line color to orange.
        UIColor.orange.setStroke()
        
        // Set the fill color to yellow.
        UIColor.yellow.setFill()
        
        // Fill color.
        rect2.fill()
        
        // Set the thickness of the line.
        rect2.lineWidth = 3.0
        
        // Drawing.
        rect2.stroke()
    }

}
