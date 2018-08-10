//
//  MenuItemVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class MenuItemVC: BaseViewController, UITextFieldDelegate {
    
    lazy var textField: UITextField = {
        // Create TextField.
        let tf: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        tf.text = "Hello Swift!"
        tf.delegate = self
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add TextField on view
        self.view.addSubview(self.textField)
        
        // MenuController generated.
        let menuController: UIMenuController = UIMenuController.shared
        
        // Show MenuController.
        menuController.isMenuVisible = true
        
        // Set the direction of the arrow down.
        menuController.arrowDirection = UIMenuControllerArrowDirection.down
        
        // Set rect, view.
        menuController.setTargetRect(CGRect.zero, in: self.view)
        
        // MenuItem generation.
        let menuItem_1: UIMenuItem = UIMenuItem(title: "Menu1", action: #selector(onMenu1(sender:)))
        let menuItem_2: UIMenuItem = UIMenuItem(title: "Menu2", action: #selector(onMenu2(sender:)))
        let menuItem_3: UIMenuItem = UIMenuItem(title: "Menu3", action: #selector(onMenu3(sender:)))
        
        // Store MenuItem in array.
        let myMenuItems: [UIMenuItem] = [menuItem_1, menuItem_2, menuItem_3]
        
        // Added MenuItem to MenuController.
        menuController.menuItems = myMenuItems
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called immediately after UITextField is started editing.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    // Called just before UITextField finished editing.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        return true
    }
    
    // Make the created MenuItem visible.
    override func canPerformAction(_ action: Selector, withSender sender: Any!) -> Bool {
        if [#selector(onMenu1(sender:)), #selector(onMenu2(sender:)), #selector(onMenu3(sender:))].contains(action) {
            return true
        } else {
            return false
        }
    }
    
    // Called when the created MenuItem is pressed.
    @objc internal func onMenu1(sender: UIMenuItem) {
        print("onMenu1")
    }
    
    @objc internal func onMenu2(sender: UIMenuItem) {
        print("onMenu2")
    }
    
    @objc internal func onMenu3(sender: UIMenuItem) {
        print("onMenu3")
    }
    
}
