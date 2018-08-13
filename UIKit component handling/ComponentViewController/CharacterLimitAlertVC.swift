//
//  CharacterLimitAlertVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 13..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class CharacterLimitAlertVC: BaseViewController, UITextFieldDelegate {
    
    // Generate Button.
    lazy var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        b.layer.cornerRadius = 20.0
        b.backgroundColor = UIColor.red
        b.setTitle("Start UIAlert", for: .normal)
        b.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return b
    }()
    
    var InputStr:String!
    
    // The maximum number of characters that can be input.
    let maxLength: Int = 6

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func onClickButton(sender: UIButton) {
        // Alert generation.
        let alert: UIAlertController = UIAlertController(title: "title", message: "Enter up to 6 characters", preferredStyle: UIAlertControllerStyle.alert)
        
        // Cancel action generation.
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }
        
        // OK action generation.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction!) -> Void in
            print("OK")
        }
        
        // Add a TextField to the Alert.
        alert.addTextField { (textField: UITextField!) -> Void in
            // Set delegate
            textField.delegate = self
        }
        
        // Add an action to Alert.
        alert.addAction(OkAction)
        alert.addAction(CancelAction)
        
        // Activate Alert.
        present(alert, animated: true, completion: nil)
    }
    
    // Called when text is edited.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Limit input when the input character exceeds 6 characters.
        if range.location < maxLength {
            textField.isEnabled = true
            // Display the input characters.
            print(textField.text!)
            return true
        } else {
            textField.isEnabled = false
            print("More than 6 characters")
            return false
        }
    }
    
}
