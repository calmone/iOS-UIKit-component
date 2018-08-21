//
//  AnimationSummaryVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class AnimationSummaryVC: BaseViewController {
    
    // Generate label
    lazy var label: UILabel = {
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        myLabel.backgroundColor = UIColor(red: 0.261, green: 0.737, blue: 0.561, alpha: 1.0)
        myLabel.center = self.view.center
        myLabel.text = "*･゜ﾟ･*:.｡..｡.:*･゜"
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.textColor = UIColor.white
        
        return myLabel
    }()
    
    // Generate segmentesController
    lazy var segcon: UISegmentedControl = {
        let mySegcon = UISegmentedControl(items: ["Spring", "Invert", "Rotate", "Scaling", "Move"])
        mySegcon.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        mySegcon.tintColor = UIColor.blue
        mySegcon.addTarget(self, action: #selector(changedValue(_:)), for: UIControlEvents.valueChanged)
        
        return mySegcon
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add label on view
        self.view.addSubview(label)
        
        // Add seqcon on view
        self.view.addSubview(segcon)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // A method called when the value of SegmentedController changes.
    @objc private func changedValue(_ sender: UISegmentedControl) {
        label.center = self.view.center
        
        // Processing of each animation.
        switch(sender.selectedSegmentIndex) {
        case 0: // An animation that makes a movement like a spring.
            // Set animation time to 2 seconds.
            UIView.animate(withDuration: 2.0,
                           // Delay time.
                delay: 0.0,
                // Elastic force of the spring The smaller the elastic force the larger the elastic force.
                usingSpringWithDamping: 0.2,
                // Initial velocity.
                initialSpringVelocity: 1.5,
                // Constant speed.
                options: UIViewAnimationOptions.curveLinear,
                animations: { () -> Void in
                    self.label.layer.position = CGPoint(x: self.view.frame.width - 50, y: 100)
                    // Processing when animation is completed
            }) { (Bool) -> Void in
                self.label.center = self.view.center
            }
        case 1: // Animation that inverts in the X and Y directions respectively.
            // Set animation time to 3 seconds
            UIView.animate(withDuration: 3.0,
                animations: { () -> Void in
                    // Create an affine matrix for reversing in X direction
                    self.label.transform = self.label.transform.scaledBy(x: -1.0, y: 1.0)
                    // Continuous animation processing.
            }) { (Bool) -> Void in
                UIView.animate(withDuration: 3.0,
                    animations: { () -> Void in
                        // Create an affine matrix for inversion in Y direction
                        self.label.transform = self.label.transform.scaledBy(x: 1.0, y: -1.0)
                        // Processing when animation is completed
                }) { (Bool) -> Void in
                }
            }
        case 2: // Rotation animation.
            // Initialization.
            self.label.transform = CGAffineTransform(rotationAngle: 0)
            // Specify rotation angle with radian (90 degrees).
            let angle:CGFloat = CGFloat(Double.pi/2)
            // Set the number of seconds of animation (3 seconds).
            UIView.animate(withDuration: 3.0,
                           animations: { () -> Void in
                            // Generate an affine matrix for rotation.
                            self.label.transform = CGAffineTransform(rotationAngle: angle)
            },
                           completion: { (Bool) -> Void in
            })
        case 3: // Scaling animation.
            self.label.transform = CGAffineTransform(scaleX: 1, y: 1)
            // Set animation time to 3 seconds.
            UIView.animate(withDuration: 3.0,
                           animations: { () -> Void in
                            // Create an affine matrix for reduction.
                            self.label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })// Continuous animation processing.
            { (Bool) -> Void in
                UIView.animate(withDuration: 3.0,
                    animations: { () -> Void in
                        // Create an affine matrix for magnification.
                        self.label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                }) // Processing when the animation is completed.
                { (Bool) -> Void in
                    // Restore size to original.
                    self.label.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        case 4: // Animation to move.
            label.layer.position = CGPoint(x: -30, y: -30)
            // animation processing
            UIView.animate(withDuration: TimeInterval(CGFloat(3.0)),
                           animations: {() -> Void in
                            // Specify the destination coordinates.
                            self.label.center = CGPoint(x: self.view.frame.width/2,y: self.view.frame.height/2);
            }, completion: {(Bool) -> Void in
            })
        default: print("error!")
        }
    }
    
}
