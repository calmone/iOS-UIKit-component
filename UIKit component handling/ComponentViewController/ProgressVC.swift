//
//  ProgressVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ProgressVC: BaseViewController {
    
    lazy var progressView: UIProgressView = {
        // Create a ProgressView.
        let pv: UIProgressView = UIProgressView(frame: CGRect(x:0, y:0, width:200, height:10))
        pv.progressTintColor = UIColor.green
        pv.trackTintColor = UIColor.white
        
        // Set the coordinates.
        pv.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        
        // Set the height of the bar (1.0 times horizontally, 2.0 times vertically).
        pv.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
        
        // Set the progress degree (0.0 to 1.0).
        pv.progress = 0.0
        
        // Add an animation.
        pv.setProgress(1.0, animated: true)
        
        return pv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .black
        
        // Add UIProgressView on view
        self.view.addSubview(self.progressView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
