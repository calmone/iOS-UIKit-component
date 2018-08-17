//
//  DrawLineView.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DrawLineView: UIView {

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
        
        // Generate BezierPath.
        let line: UIBezierPath = UIBezierPath()
        
        // Set the line color to blue.
        UIColor.red.setStroke()
        
        // Set the start point.
        line.move(to: CGPoint.zero)
        
        // Set the next point.
        line.addLine(to: CGPoint(x: 50, y: 150))
        line.addLine(to: CGPoint(x: 200, y: 100))
        
        // Set the end point.
        line.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        
        // Connect start and end points and close.
        line.close()
        
        // Set the fill color.
        UIColor.yellow.setFill()
        
        // Fill the closed inside with a line.
        line.fill()
        
        // Set the thickness of the line.
        line.lineWidth = 3.0
        
        // Drawing.
        line.stroke()
    }

}
