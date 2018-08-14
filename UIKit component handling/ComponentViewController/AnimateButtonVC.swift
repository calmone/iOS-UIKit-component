//
//  AnimateButtonVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class AnimateButtonVC: BaseViewController {
    
    lazy var button: UIButton = {
        // Generate Button.
        let b = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        b.backgroundColor = UIColor.green
        b.layer.masksToBounds = true
        b.setTitle("button", for: UIControlState.normal)
        b.setTitleColor(UIColor.white, for: UIControlState.normal)
        b.layer.cornerRadius = 50.0
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        // Add an event at TouchDown.
        b.addTarget(self, action: #selector(onDownButton(sender:)), for: .touchDown)
        
        // Add an event at TouchUp.
        b.addTarget(self, action: #selector(onUpButton(sender:)), for: [.touchUpInside, .touchUpOutside])
        
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event (Down)
    @objc func onDownButton(sender: UIButton){
        //UIView.animateWithDuration
        UIView.animate(withDuration: 0.06,
                       // Processing during animation.
            animations: { () -> Void in
                // Create an affine matrix for reduction.
                self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        { (Bool) -> Void in
            
        }
    }
    
    // Button event (Up)
    @objc func onUpButton(sender: UIButton){
        UIView.animate(withDuration: 0.1,
                       // Processing during animation.
            animations: { () -> Void in
                // Create an affine matrix for magnification.
                self.button.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                // Create an affine matrix for reduction.
                self.button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        { (Bool) -> Void in
            
        }
    }

}
