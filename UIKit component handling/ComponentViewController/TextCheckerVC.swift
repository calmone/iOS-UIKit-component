//
//  TextCheckerVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class TextCheckerVC: BaseViewController {
    
    // Generate button.
    lazy var button: UIButton = {
        let b = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        b.backgroundColor = UIColor.red
        b.layer.masksToBounds = true
        b.setTitle("To check", for: UIControlState.normal)
        b.setTitleColor(UIColor.white, for: UIControlState.normal)
        b.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        b.layer.cornerRadius = 20.0
        b.layer.position = CGPoint(x: self.view.frame.width/2, y:250)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: .touchUpInside)
        
        return b
    }()
    
    lazy var textView: UITextView = {
        let tv = UITextView(frame: CGRect(x: 0, y: 0, width: 300, height: 250))
        tv.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY + 150)
        tv.backgroundColor = UIColor.black
        tv.textColor = UIColor.white
        tv.textAlignment = NSTextAlignment.left
        tv.text = "By any chance: "
        tv.font = UIFont.systemFont(ofSize: CGFloat(20))
        tv.isEditable = false
        
        return tv
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        tf.borderStyle = UITextBorderStyle.roundedRect
        tf.layer.position = CGPoint(x: self.view.bounds.width/2, y: 150)
        
        return tf
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
        
        // Add textView on view
        self.view.addSubview(textView)
        
        // Add textField on view
        self.view.addSubview(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // A method called when the Button is pressed.
    @objc private func onClickButton(_ sender: UIButton) {
        // Perform a spelling check.
        suggestUpdate()
    }
    
    // Method to check spelling.
    func suggestUpdate() {
        
        // Declaration of UITextChecker.
        let checker : UITextChecker = UITextChecker()
        
        // Get the number of characters in text.
        let length = textField.text?.count
        
        // Specify the spelling range (0 ~ number of entered characters).
        let checkRange: NSRange = NSMakeRange(0, length!)
        
        // Look for things with wrong spelling from the range.
        let misspelledRange: NSRange = checker.rangeOfMisspelledWord(
            
            // Specify the character to check.
            in: textField.text!,
            
            // Specify the range to check.
            range: checkRange,
            
            // Specify the start position as the beginning of the range.
            startingAt: checkRange.location,
            
            // Even if no mistakes are found within the specified range start searching from the range start position (false hold the end position where no mistakes were found)
            wrap: true,
            
            // Specify language as English.
            language: "en_US")
        
        // If a misspelling is found.
        if misspelledRange.location != NSNotFound {
            
            // Obtain correct spelling candidates.
            let candidateArray: [String] = checker.guesses(
                
                // The range where there is a misspelling.
                forWordRange: misspelledRange,
                
                // Characters containing misspellings (in range).
                in: textField.text!,
                
                // Specify the language.
                language: "en_US")!
            
            var str = "By any chance:\n"
            
            // Retrieve the candidates one by one from the array.
            for text in candidateArray {
                str += text.description
                str += ", "
            }
            textView.text = str
        }
    }

}
