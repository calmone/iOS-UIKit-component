//
//  ButtonVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 27..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ButtonVC: BaseViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        
        // Define the size of the button.
        let width: CGFloat = 300
        let height: CGFloat = 100
        
        // Define coordinates to be placed.
        // (center of screen)
        let posX: CGFloat = self.view.bounds.width/2 - width/2
        let posY: CGFloat = self.view.bounds.height/2 - height/2
        
        // Set the button installation coordinates and size.
        button.frame = CGRect(x: posX, y: posY, width: width, height: height)
        
        // Set the background color of the button.
        button.backgroundColor = .orange
        
        // Round the button frame.
        button.layer.masksToBounds = true
        
        // Set the radius of the corner.
        button.layer.cornerRadius = 20.0
        
        // Set the title (normal).
        button.setTitle("Button (Normal)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        // Set the title (highlighted).
        button.setTitle("Button (highlighted)", for: .highlighted)
        button.setTitleColor(.black, for: .highlighted)
        
        // Tag a button.
        button.tag = 1
        
        // Add an event.
        button.addTarget(self, action: #selector(onClickMyButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIButton to view.
        self.view.addSubview(self.button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event.
    @objc internal func onClickMyButton(_ sender: Any) {
        if let button = sender as? UIButton {
            print("onClickButton");
            print("button.currentTitle: \((button.currentTitle) ?? "Empty")")
            print("button.tag: \(button.tag)")
        }
    }

}
