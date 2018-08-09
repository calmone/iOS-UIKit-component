//
//  StepperVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class StepperVC: BaseViewController {
    
    lazy var stepLabel: UILabel = {
        // Create Label.
        let l: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        l.backgroundColor = UIColor.blue
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 75.0
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.font = UIFont.systemFont(ofSize: 30.0)
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        l.text = "\(self.stepper.value)"
        
        return l
    }()

    lazy var stepper: UIStepper = {
        // Create Stepper.
        let s: UIStepper = UIStepper()
        s.center = CGPoint(x: self.view.frame.width/2, y: 400)
        s.backgroundColor = UIColor.gray
        s.tintColor = UIColor.white
        s.addTarget(self, action: #selector(stepperOnChanged(stepper:)), for: UIControlEvents.valueChanged)
        
        // Set the minimum value, maximum value, specified value.
        s.minimumValue = 0
        s.maximumValue = 100
        s.value = 50
        
        // Set the value of the moving value when pressing the button.
        s.stepValue = 10
        
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UILabel on view
        self.view.addSubview(self.stepLabel)
        
        // Add UIStepper on view
        self.view.addSubview(self.stepper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // It is called when the value of Stepper changes.
    @objc func stepperOnChanged(stepper: UIStepper){
        self.stepLabel.text = "\(stepper.value)"
    }
    
}
