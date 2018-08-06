//
//  TextFieldVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 30..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class TextFieldVC: BaseViewController, UITextFieldDelegate {
    
    lazy var textField: UITextField = {
        // Set x, y and width and height to place UITextField.
        let width: CGFloat = 250
        let height: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - width)/2
        let posY: CGFloat = (self.view.bounds.height - height)/2
        
        // Create a UITextField.
        let textField = UITextField(frame: CGRect(x: posX, y: posY, width: width, height: height))
        
        // Substitute the characters to be displayed.
        textField.text = "Hello calmone :)"
        
        // Set Delegate to itself
        textField.delegate = self
        
        // Display frame.
        textField.borderStyle = .roundedRect
        
        // Add clear button.
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add UITextField to view
        self.view.addSubview(self.textField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called just before UITextField is edited
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \((textField.text) ?? "Empty")")
    }
    
    // Called immediately after UITextField is edited
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \((textField.text) ?? "Empty")")
    }
    
    // Called when the line feed button is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \((textField.text) ?? "Empty")")
        
        // Process of closing the Keyboard when the line feed button is pressed.
        textField.resignFirstResponder()
        
        return true
    }
    
}
