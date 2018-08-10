//
//  LimitedTextFieldVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class LimitedTextFieldVC: BaseViewController, UITextFieldDelegate {
    
    // Generate UITextField.
    lazy var limitdTextField: UITextField = {
        let tf: UITextField = UITextField(frame: CGRect(x :0, y: 0, width: 200, height: 30))
        // First character to display.
        tf.text = "Hi calmone :)"
        
        // Set Delegate.
        tf.delegate = self
        
        // Display frame line.
        tf.borderStyle = UITextBorderStyle.roundedRect
        
        // The position to display in UITextField.
        tf.layer.position = CGPoint(x: self.view.bounds.width/2, y: 150)
        
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add limitedTextField on view
        self.view.addSubview(limitdTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when text is edited.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Decide the maximum number of characters.
        let maxLength: Int = 20
        
        // Acquires the input character and the input character together.
        let str = (textField.text ?? "") + string
        
        // Return true if the number of characters is maxLength or less.
        if str.count < maxLength {
            return true
        } else {
            appDelegate()?.showAlert(vc: self, title: "characters", message: "It exceeds 20 characters", actionTitle: "OK", actionStyle: .default)
            return false
        }
    }

}
