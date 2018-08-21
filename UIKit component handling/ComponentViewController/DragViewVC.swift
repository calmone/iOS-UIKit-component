//
//  DragViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DragViewVC: BaseViewController {
    
    // Generate circleLabel
    lazy var circleLabel: UILabel = {
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        l.text = "Drag!"
        l.textAlignment = NSTextAlignment.center
        l.backgroundColor = UIColor.red
        l.layer.masksToBounds = true
        l.center = self.view.center
        l.layer.cornerRadius = 40.0
        
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .black
        
        // Add circleLabel on view
        self.view.addSubview(circleLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // A method called when touch is sensed.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        // Label animation.
        UIView.animate(withDuration: 0.06,
                       // Processing during animation.
            animations: { () -> Void in
                // Create an affine matrix for reduction.
                self.circleLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        { (Bool) -> Void in
        }
    }
    
    // A method called when sensing a drug.
    // (Called many times during drug)
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
        // Get a touch event.
        let aTouch: UITouch = touches.first!
        
        // Get coordinates of the destination you moved.
        let location = aTouch.location(in: self.view)
        
        // Get coordinates before moving.
        let prevLocation = aTouch.previousLocation(in: self.view)
        
        // Generate CGRect.
        var myFrame: CGRect = self.view.frame
        
        // Take x, y distance moved by dragging.
        let deltaX: CGFloat = location.x - prevLocation.x
        let deltaY: CGFloat = location.y - prevLocation.y
        
        // Place the distance of the moved part on the coordinate of myFrame.
        myFrame.origin.x += deltaX
        myFrame.origin.y += deltaY
        
        // Added myFrame to frame.
        self.view.frame = myFrame
    }
    
    // A method called when sensing that a finger has left.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        
        // Label animation.
        UIView.animate(withDuration: 0.1,
                       // Processing during animation.
            animations: { () -> Void in
                // Create an affine matrix for magnification.
                self.circleLabel.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                // Create an affine matrix for reduction.
                self.circleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        { (Bool) -> Void in
            
        }
    }
    
}
