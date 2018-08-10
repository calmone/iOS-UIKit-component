//
//  SwitchVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SwitchVC: BaseViewController {
    
    lazy var label: UILabel = {
        // Create a label to display On / Off.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        label.backgroundColor = UIColor.gray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 75.0
        label.textColor = UIColor.white
        label.shadowColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.textAlignment = NSTextAlignment.center
        label.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        label.text = "On"
        
        return label
    }()
    
    lazy var controlSwitch: UISwitch = {
        // Create a Switch.
        let swicth: UISwitch = UISwitch()
        swicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        
        // Display the border of Swicth.
        swicth.tintColor = UIColor.orange
        
        // Set Switch to On.
        swicth.isOn = true
        
        // Set the event to be called when switching On / Off of Switch.
        swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControlEvents.valueChanged)
        
        return swicth
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UILabel on view
        self.view.addSubview(self.label)
        
        // Add UISwitch on view
        self.view.addSubview(self.controlSwitch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onClickSwitch(sender: UISwitch) {
        var text: String!
        var color: UIColor!
        
        if sender.isOn {
            text = "On"
            color = UIColor.gray
        } else {
            text = "Off"
            color = UIColor.orange
        }
        
        self.label.text = text
        self.label.backgroundColor = color
    }

}
