//
//  BezierPathVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class BezierPathVC: BaseViewController {
    
    lazy var segcon: UISegmentedControl = {
        // Generate SegmentedController.
        let sc = UISegmentedControl(items: ["Circle", "Rectangle", "Line"])
        sc.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        sc.tintColor = UIColor.blue
        sc.addTarget(self, action: #selector(changedValue(sender:)), for: UIControlEvents.valueChanged)
        
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add segmentedController on view
        self.view.addSubview(segcon)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // A method called when the value of SegmentedController changes.
    @objc func changedValue(sender: UISegmentedControl) {
        var drawView: UIView!
        
        // Create an instance of each class according to the value of SegmentedController.
        switch(sender.selectedSegmentIndex) {
        case 0: drawView = DrawCircleView(frame: CGRect(x: 0, y: 100, width: 300, height: 300))
        case 1: drawView = DrawRectangleView(frame: CGRect(x: 0, y: 100, width: 300, height: 300))
        case 2: drawView = DrawLineView(frame: CGRect(x:0, y: 100, width: 300, height: 300))
        default: print("error")
        }
        
        // Set the center of drawing for drawing.
        drawView.center = CGPoint(x: self.view.frame.width/2, y: 300)
        drawView.backgroundColor = UIColor.white
        
        // Added drawing view to view.
        self.view.addSubview(drawView)
    }

}
