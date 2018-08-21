//
//  AttachmentVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class AttachmentVC: BaseViewController {
    
    // Generate button.
    lazy var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        b.layer.position = self.view.center
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.setTitleColor(UIColor.white, for: UIControlState.normal)
        b.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        b.backgroundColor = UIColor.red
        b.setTitle("Dropped!", for: UIControlState.normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: UIControlEvents.touchUpInside)
        
        return b
    }()
    
    // Generate view.
    lazy var springView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 50))
        v.layer.position = self.view.center
        v.backgroundColor = UIColor.brown
        
        return v
    }()
    
    
    // You must save the instance of UIDynamicAnimator and the animation will not run.
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
        
        // Add springView on view
        self.view.addSubview(springView)
        
        // Generate UIDynamicAnimator and save instance.
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // Generate gravity and attach it to Button.
        gravity = UIGravityBehavior(items: [button])
        
        // Generate attachment.
        let attach = UIAttachmentBehavior(item: button, attachedToAnchor: self.view.center)
        
        // Attenuation value.
        attach.damping = 0.01
        
        // Amplitude.
        attach.frequency = 1.0
        
        // The length of the string.
        attach.length = 100
        
        // Set the block statement called when the animation is moving.
        attach.action = {
            var rect = self.springView.frame
            rect.size.height = self.button.frame.origin.y - rect.origin.y
            self.springView.frame = rect
        }
        
        // Added attach to UIDynamicAnimator.
        animator.addBehavior(attach)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // A method called when a Button is pressed.
    @objc private func onClickButton(_ sender : UIButton){
        // Added gravity to UIDynamicAnimator.
        animator.addBehavior(gravity)
    }

}
