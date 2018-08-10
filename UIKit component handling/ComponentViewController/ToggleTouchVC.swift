//
//  ToggleTouchVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ToggleTouchVC: BaseViewController {
    
    private var cnt : Float = 0
    private var ButtonCnt: Int = 0
    private var TimerMergin: Float = 0
    private var ignoreBegineTime: Float = 0
    
    // Make a label for the timer.
    lazy var label: UILabel = {
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        l.backgroundColor = UIColor.orange
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 20.0
        l.text = "Time:\(Int(cnt))"
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        
        return l
    }()
    
    // Generate Button.
    lazy var button: UIButton = {
        let b: UIButton = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        b.layer.cornerRadius = 20.0
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: 400)
        b.backgroundColor = UIColor.red
        b.setTitle("Enable / Disable", for: .normal)
        b.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add label on view
        self.view.addSubview(self.label)
        
        // Add button on view
        self.view.addSubview(self.button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Method called for every second number specified by NSTimerInterval.
    @objc func onUpdate(timer : Timer){
        cnt += 0.1
        // Create a character string by specifying the number of digits.
        let str = "Time: \(Int(cnt))"
        self.label.text = str
        
        // Difference in time when invalidation started from the current timer time.
        TimerMergin = cnt - ignoreBegineTime
        
        // When the touch event is invalid.
        if UIApplication.shared.isIgnoringInteractionEvents {
            // It is 5 seconds since it became invalid.
            if Int(TimerMergin) == 5 {
                print("Invalid touch event")
                self.view.backgroundColor = UIColor.blue
                
                // Enable touch events.
                UIApplication.shared.endIgnoringInteractionEvents()
                print("Touch event enabled")
            }
        }
    }
    
    @objc private func onClickButton(sender: UIButton) {
        // Number of times the button was pressed.
        ButtonCnt += 1
        
        // When the touch event is valid.
        if UIApplication.shared.isIgnoringInteractionEvents == false {
            
            print("Touch event is valid")
            self.view.backgroundColor = UIColor.green
            
            // Disable the touch event.
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            // Get the time when invalidation began.
            ignoreBegineTime = cnt
            
            print("Touch event was disabled")
            print("It will take effect in 5 seconds")
            
            // Create a timer only when you press the button first.
            if ButtonCnt == 1 {
                // Make a timer.
                // Update interval (0.1 seconds).
                Timer.scheduledTimer(timeInterval: 0.1, target: self,
                    // Method.
                    selector: #selector(onUpdate(timer:)),
                    userInfo: nil,
                    // Whether it will be called many times.
                    repeats: true)
            }
        }
    }

}
