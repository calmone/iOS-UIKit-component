//
//  ActivityIndicatorVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ActivityIndicatorVC: BaseViewController {

    lazy var activityIndicator: UIActivityIndicatorView = {
        // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        
        // Also show the indicator even when the animation is stopped.
        activityIndicator.hidesWhenStopped = false
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        
        // Start animation.
        activityIndicator.startAnimating()
        
        return activityIndicator
    }()
    
    lazy var button: UIButton = {
        // Create a button.
        let button = UIButton(frame: CGRect(x:0, y:0, width:60, height:60))
        button.backgroundColor = UIColor.red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30.0
        button.setTitle("Stop", for: .normal)
        button.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-50)
        button.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the background color to black.
        self.view.backgroundColor = UIColor.black
        
        // Add UIActivityIndicatorView on view
        self.view.addSubview(self.activityIndicator)
        
        // Add UIButton on view
        self.view.addSubview(self.button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event.
    @objc func onClickButton(sender: UIButton){
        
        if self.activityIndicator.isAnimating {
            self.activityIndicator.stopAnimating()
            self.button.setTitle("Start", for: .normal)
            self.button.backgroundColor = UIColor.blue
        }
        else {
            self.activityIndicator.startAnimating()
            self.button.setTitle("Stop", for: .normal)
            self.button.backgroundColor = UIColor.red
        }
    }
    
}
