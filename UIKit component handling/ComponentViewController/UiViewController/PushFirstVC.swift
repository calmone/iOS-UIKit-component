//
//  PushFirstVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 6..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class PushFirstVC: BaseViewController {

    // Generate UIButton
    lazy var nextButton: UIButton = {
        // Create a button.
        let button: UIButton = UIButton(frame: CGRect(x: 0,y: 0, width: 120, height: 50))
        button.backgroundColor = UIColor.red
        button.layer.masksToBounds = true
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.position = CGPoint(x: self.view.bounds.width/2 , y:self.view.bounds.height-50)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the background color to Green.
        self.view.backgroundColor = .green
        
        //Add UIButton on view
        self.view.addSubview(self.nextButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event.
    @objc private func buttonPressed(_ sender: Any) {
        // Define the View to transition.
        let secondVC: UIViewController = PushSecondVC(componentName: "SecondVC")
        
        // Move the View.
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
