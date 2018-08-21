//
//  GravityViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class GravityViewVC: BaseViewController {
    
    // Generate label
    lazy var label: UILabel = {
        let l: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        l.backgroundColor = UIColor.orange
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 20.0
        l.text = "Hello calmone!!"
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.bounds.width/2, y: -200)
        
        return l
    }()
    
    // Generate boxView
    lazy var boxView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        v.backgroundColor = UIColor.blue
        v.layer.masksToBounds = true
        v.layer.position = CGPoint(x: self.view.frame.midX - 50, y: self.view.frame.midY)
        
        return v
    }()
    
    // Generate button
    lazy var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        b.layer.position = CGPoint(x: self.view.frame.midX, y: 500)
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.setTitleColor(UIColor.white, for: UIControlState.normal)
        b.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        b.backgroundColor = UIColor.red
        b.setTitle("Dropped!", for: UIControlState.normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: UIControlEvents.touchUpInside)
        b.tag = 0
        
        return b
    }()
    
    // Generate resetButton
    lazy var resetButton: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        b.layer.position = CGPoint(x: self.view.frame.midX, y: 400)
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.setTitleColor(UIColor.white, for: UIControlState.normal)
        b.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        b.backgroundColor = UIColor.blue
        b.setTitle("Reset!", for: UIControlState.normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: UIControlEvents.touchUpInside)
        b.tag = 1
        
        return b
    }()
    
    // The UIDynamicAnimator does not execute the animation unless you save the instance.
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add label on view
        self.view.addSubview(label)
        
        // Add boxView on view
        self.view.addSubview(boxView)
        
        // Add button on view
        self.view.addSubview(button)
        
        // Add resetButton on view
        self.view.addSubview(resetButton)
        
        // Generate UIDynamiAnimator and save instance.
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // Create gravity and apply it to View.
        gravity = UIGravityBehavior(items: [label])
        
        // Create Collision and apply it to View.
        let collision = UICollisionBehavior(items: [label, boxView])
        
        // Specify the behavior of Collision.
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: boxView.frame))
        
        // Run Collision's animation.
        animator.addBehavior(collision)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        switch(sender.tag) {
        case 0: // DropButton.
            // Run animation of Gravity.
            animator.addBehavior(gravity)
        case 1: // ResetButton.
            self.navigationController?.popViewController(animated: true)
        default: print("error!")
        }
    }
    
}
