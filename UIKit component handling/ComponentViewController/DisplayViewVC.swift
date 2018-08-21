//
//  DisplayViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DisplayViewVC: BaseViewController {
    
    // Generate displayView
    lazy var displayView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        v.backgroundColor = UIColor.orange
        v.alpha = 0.5
        v.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        v.isHidden = true
        
        return v
    }()
    
    // Generate displayButton
    lazy var displayButton: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        b.backgroundColor = UIColor.red
        b.layer.cornerRadius = 20.0
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-50)
        b.setTitle("Appear", for: .normal)
        b.setTitleColor(UIColor.white, for: .normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: .touchUpInside)
        
        return b
    }()
    
    var flag: Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add displayView on view
        self.view.addSubview(displayView)
        
        // Add displayButton on view
        self.view.addSubview(displayButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        if !flag { // display myView if flag is false.
            // display displayView.
            displayView.isHidden = false
            
            // Change button title.
            displayButton.setTitle("Disappear", for: .normal)
            
            flag = true
        } else { // hide displayView if flag is true.
            // hide displayView.
            displayView.isHidden = true
            
            // Change button title.
            displayButton.setTitle("Appear", for: .normal)
            
            flag = false
        }
    }

}
