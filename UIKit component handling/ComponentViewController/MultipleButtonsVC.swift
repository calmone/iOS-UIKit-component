//
//  MultipleButtonsVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class MultipleButtonsVC: BaseViewController {
    
    // Generate mainButton
    lazy var mainButton: UIButton = {
        let mainButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mainButton.center = self.view.center
        mainButton.layer.masksToBounds = true
        mainButton.layer.cornerRadius = 50.0
        mainButton.backgroundColor = UIColor.red
        mainButton.setTitle("Fire!", for: .normal)
        mainButton.setTitleColor(UIColor.white, for: .normal)
        mainButton.tag = 0
        
        return mainButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Generate customButton
        let customButton: CustomButton = CustomButton(frame: self.view.frame)
        customButton.mainButton = self.mainButton
        customButton.mainPosition = self.mainButton.layer.position
        
        // Add customButton on view
        self.view.addSubview(customButton)
        
        mainButton.addTarget(customButton, action: #selector(CustomButton.onDownMainButton(_:)), for: UIControlEvents.touchUpInside)
        mainButton.addTarget(customButton, action: #selector(CustomButton.onUpMainButton(_:)), for: [.touchUpInside, .touchDragOutside])
        
        // Add mainButton on view
        self.view.addSubview(mainButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class CustomButton: UIView {
    
    // Generate sub button (popup button)
    lazy var subButton_1: UIButton = {
        return UIButton()
    }()
    
    lazy var subButton_2: UIButton = {
        return UIButton()
    }()
    
    lazy var subButton_3: UIButton = {
        return UIButton()
    }()
    
    lazy var subButton_4: UIButton = {
        return UIButton()
    }()
    
    lazy var subButton_5: UIButton = {
        return UIButton()
    }()
    
    var mainButton: UIButton!
    
    var colors: [UIColor]!
    
    var mainPosition: CGPoint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // Main Button Event (Down)
    @objc func onDownMainButton(_ sender: UIButton) {
        // Set the background to black.
        self.backgroundColor = UIColor.black

        UIView.animate(withDuration: 0.06,
                       // Processing during animation.
            animations: { () -> Void in
                // Create an affine matrix for reduction.
                sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        { (Bool) -> Void in
        }
    }
    
    // Method that returns the coordinates of the sub button
    func getPosition(angle: CGFloat, radius: CGFloat) -> CGPoint {
        // Convert from degrees to radians.
        let radian = angle * CGFloat(Double.pi) / 180.0
        
        // Calculate the x coordinate.
        let x_position:CGFloat = mainButton.layer.position.x + radius * cos(radian)
        
        // Calculate the y coordinate.
        let y_position = mainPosition.y + radius * sin(radian)
        let position = CGPoint(x: x_position, y: y_position)
        
        return position
    }
    
    // Main Button Event (Up)
    @objc func onUpMainButton(_ sender: UIButton) {
        
        // Store sub button in array.
        let buttons = [subButton_1, subButton_2, subButton_3, subButton_4, subButton_5]
        
        // Store UIColor for sub button in array.
        colors = [UIColor.yellow, UIColor.green, UIColor.cyan, UIColor.magenta, UIColor.purple]
        
        // distance from the main button (radius).
        let radius: CGFloat = 150
        
        // Various settings on sub button.
        for i in 0 ..< buttons.count {
            buttons[i].frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            buttons[i].layer.cornerRadius = 30.0
            buttons[i].backgroundColor = colors[i]
            buttons[i].center = self.center
            buttons[i].addTarget(self, action: #selector(onClickSubButtons(_:)), for: UIControlEvents.touchUpInside)
            buttons[i].tag = i+1
            
            // Add sub button to view.
            self.addSubview(buttons[i])
        }
        
        UIView.animate(withDuration: 0.06,
                       // Processing during animation.
            animations: { () -> Void in
                // Create an affine matrix for magnification.
                sender.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                // Create an affine matrix for reduction.
                sender.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        { (Bool) -> Void in
        }
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.0,
                       // Set the spring.
            usingSpringWithDamping: 0.5,
            
            // Elastic force of the spring.
            initialSpringVelocity: 1.5,
            options: UIViewAnimationOptions.curveEaseIn,
            
            // Processing during animation.
            animations: { () -> Void in
                
                // Processing during animation.
                self.subButton_1.layer.position = self.getPosition(angle: -90, radius: radius)
                self.subButton_2.layer.position = self.getPosition(angle: -30, radius: radius)
                self.subButton_3.layer.position = self.getPosition(angle: -60, radius: radius)
                self.subButton_4.layer.position = self.getPosition(angle: -120, radius: radius)
                self.subButton_5.layer.position = self.getPosition(angle: -150, radius: radius)
        }) { (Bool) -> Void in
        }
    }
    
    
    // sub button event
    // Set background color.
    @objc func onClickSubButtons(_ sender: UIButton) {
        // Set the background color to the color of the sub button.
        switch(sender.tag) {
        case 1:
            self.backgroundColor = colors[0]
        case 2:
            self.backgroundColor = colors[1]
        case 3:
            self.backgroundColor = colors[2]
        case 4:
            self.backgroundColor = colors[3]
        case 5:
            self.backgroundColor = colors[4]
        default:
            self.backgroundColor = UIColor.black
        }
    }
    
}
