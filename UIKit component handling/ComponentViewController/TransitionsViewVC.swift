//
//  TransitionsViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class TransitionsViewVC: BaseViewController {
    
    lazy var transitionView: UIView = {
        // Generate view.
        let v = UIView(frame: self.view.frame)
        v.backgroundColor = UIColor.orange
        v.isHidden = false
        v.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        return v
    }()
    
    lazy var button: UIButton = {
        // Generate button.
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        b.backgroundColor = UIColor.red
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.setTitle("Transition", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        b.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return b
    }()
    
    // View switching flag.
    var viewFlag = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add transitionView on view
        self.view.addSubview(self.transitionView)
        // Add button on view
        self.view.addSubview(self.button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Button event
    @objc func onClickButton(sender: UIButton) {
        // Flag is true.
        if viewFlag {
            // Animation processing.
            // Which view will transition from?
            UIView.transition(from: self.view,
                // view of the transition destination.
                to: self.transitionView,
                // number of seconds (1 second).
                duration: 1.0,
                // Set the transition.
                options: UIViewAnimationOptions.transitionCurlUp,
                // Processing when the animation is completed.
                completion: { (Bool) -> Void in
                    print("self.view -> transitionView")
                    // Add a button to transitionView.
                    self.transitionView.addSubview(self.button)
            })
            // Fold the flag.
            viewFlag = false
        } else {
            UIView.transition(from: self.transitionView,
                              to: self.view,
                              duration: 1.0,
                              options: UIViewAnimationOptions.transitionFlipFromLeft,
                              completion: { (Bool) -> Void in
                                print("transitionView -> self.view")
                                // Add button on view
                                self.view.addSubview(self.button)
            })
            // Set a flag.
            viewFlag = true
        }
    }
    
}
