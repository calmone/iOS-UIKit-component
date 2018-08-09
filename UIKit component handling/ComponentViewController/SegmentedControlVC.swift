//
//  SegmentedControlVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SegmentedControlVC: BaseViewController {
    
    lazy var segLabel: UILabel = {
        // Create Label.
        let l: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        l.backgroundColor = UIColor.white
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 75.0
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.font = UIFont.systemFont(ofSize: 30.0)
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        
        return l
    }()
    
    lazy var segCon: UISegmentedControl = {
        // Create segmentedControl.
        let sc: UISegmentedControl = UISegmentedControl(items: array)
        sc.center = CGPoint(x: self.view.frame.width/2, y: 400)
        sc.backgroundColor = UIColor.gray
        sc.tintColor = UIColor.white
        
        // Add an event.
        sc.addTarget(self, action: #selector(segconChanged(segcon:)), for: UIControlEvents.valueChanged)
        
        return sc
    }()
    
    // Create an array to display.
    let array: [String] = ["Red", "Blue", "Green"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UISegmentedControl on view
        self.view.addSubview(self.segCon)
        
        // Add UILabel on view
        self.view.addSubview(self.segLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when the value of SwtterminedControl has changed.
    @objc func segconChanged(segcon: UISegmentedControl) {
        var color: UIColor!
        var text: String!
        
        switch segcon.selectedSegmentIndex {
        case 0:
            color = UIColor.red
            text = "Red"
        case 1:
            color = UIColor.blue
            text = "Blue"
        case 2:
            color = UIColor.green
            text = "Green"
        default: return
        }
        
        self.segLabel.backgroundColor = color
        self.segLabel.text = text
    }
    
}
