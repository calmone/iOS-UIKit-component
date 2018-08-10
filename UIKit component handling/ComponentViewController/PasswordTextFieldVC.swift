//
//  PasswordTextFieldVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class PasswordTextFieldVC: BaseViewController, UITextFieldDelegate {
    
    lazy var passwordTextField: UITextField = {
        // Generate UITextField.
        let tf: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        
        // Set Delegate.
        tf.delegate = self
        
        // Display frame line.
        tf.borderStyle = UITextBorderStyle.roundedRect
        
        // The position to display in UITextField.
        tf.layer.position = CGPoint(x: self.view.bounds.width/2, y: 150)
        
        // Place the entered characters in non-display mode.
        tf.isSecureTextEntry = true
        
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add passwordTextField on view
        self.view.addSubview(passwordTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.count > 0 {
            appDelegate()?.showAlert(vc: self, title: "password", message: text, actionTitle: "OK", actionStyle: .default)
        } else {
            print("Empty")
        }
        return true
    }
    
}
