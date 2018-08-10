//
//  MotionEffectVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class MotionEffectVC: BaseViewController {
    
    lazy var boxView: UIView = {
        // Create UIView.
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        v.backgroundColor = UIColor.black
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 20.0
        v.layer.position = self.view.center
        v.layer.zPosition = 1
        
        return v
    }()
    
    lazy var label: UILabel = {
        // Create Label.
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        l.backgroundColor = UIColor.gray
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 20.0
        l.text = "Hello Calmone!!"
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.textAlignment = NSTextAlignment.center
        l.layer.position = self.view.center
        l.layer.zPosition = 2
        
        return l
    }()

    var group1: UIMotionEffectGroup!
    var group2: UIMotionEffectGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add boxView on view
        self.view.addSubview(self.boxView)
        
        // Add label on view
        self.view.addSubview(self.label)
        
        applyMotionEffect(toView: self.boxView, magnitude: 50)
        applyMotionEffect(toView: self.label, magnitude: -100)
    }
    
    private func applyMotionEffect(toView view: UIView, magnitude: Float) {
        // Create an effect that changes the position of view according to the tilt of the terminal in the x axis direction.
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        // Create an effect that changes the position of view according to the tilt of the terminal in the y axis direction.
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = -magnitude
        
        // Create a group of motion effects.
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        
        // Apply the effect to view.
        view.addMotionEffect(group)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
