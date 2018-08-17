//
//  DrawCircleView.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DrawCircleView: UIView {

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
        
        let circlePoint = CGPoint(x:100, y:100)
        
        // Generate BezierPath of Yen
        let circle: UIBezierPath = UIBezierPath(arcCenter: circlePoint,
            // Radius.
            radius: 70.0,
            // First angle.
            startAngle: 0.0,
            // Final angle.
            endAngle: CGFloat(M_PI*2/4),
            // Counterclockwise.
            clockwise: false)
        
        // Set the line color to red.
        UIColor.red.setStroke()
        
        // Set the fill color to yellow.
        UIColor.yellow.setFill()
        
        // Fill the closed inside with a line.
        circle.fill()
        
        // Set the thickness of the line.
        circle.lineWidth = 3.0
        
        // Drawing.
        circle.stroke()
        
        // Generate BezierPath of an ellipse.
        let oval: UIBezierPath = UIBezierPath(ovalIn: CGRect(x:130, y:150, width:150, height:100))
        UIColor.blue.setStroke()
        UIColor.gray.setFill()
        oval.fill()
        oval.lineWidth = 2.0
        
        // Drawing.
        oval.stroke()
    }

}
