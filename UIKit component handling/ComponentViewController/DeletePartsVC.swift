//
//  DeletePartsVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DeletePartsVC: BaseViewController {
    
    lazy var button: UIButton = {
        // Generate button.
        let b = UIButton(frame: CGRect(x: 50, y: 150, width: 100, height: 100))
        b.setTitle("UIButton", for: UIControlState.normal)
        b.setTitleColor(UIColor.black, for: UIControlState.normal)
        b.backgroundColor = UIColor.green
        
        return b
    }()
    
    lazy var label: UILabel = {
        // Generate label.
        let l = UILabel(frame: CGRect(x: 50, y: 300, width: 100, height: 100))
        l.text = "UILabel"
        l.textAlignment = .center
        l.textColor = UIColor.green
        l.backgroundColor = UIColor.red
        
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
        
        print("View:\(view.description)")
        
        let views = self.view.subviews
        for view in views {
            print("View:\(view.description)")
            
            if view == self.button {
                // Remove button after 1.5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                    view.removeFromSuperview()
                    self.view.addSubview(self.label)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
