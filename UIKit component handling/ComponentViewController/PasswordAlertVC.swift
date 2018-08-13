//
//  PasswordAlertVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 13..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class PasswordAlertVC: BaseViewController, UITextFieldDelegate {
    
    // Generate button.
    lazy var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        b.layer.cornerRadius = 20.0
        b.backgroundColor = UIColor.red
        b.setTitle("Invoke UIAlert", for: .normal)
        b.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return b
    }()

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
        let alert: UIAlertController = UIAlertController(title: "title", message: "message", preferredStyle: UIAlertControllerStyle.alert)
        
        // Cancel action generation.
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }
        
        // OK action generation.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction!) -> Void in
            print("OK")
        }
        
        // Added TextField to Alert.
        alert.addTextField { (textField: UITextField!) -> Void in
            
            // Hide the entered characters.
            textField.isSecureTextEntry = true
            
            // Set Delegate.
            textField.delegate = self
        }
        
        // Added action to Alert.
        alert.addAction(CancelAction)
        alert.addAction(OkAction)
        
        // Activate Alert.
        present(alert, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Display the entered character.
        print(string)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Display the entered characters.
        print(textField.text ?? "")
    }

}
