//
//  DatePickerVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class DatePickerVC: BaseViewController {

    lazy var textField: UITextField = {
        // Create a UITextField.
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textField.text = ""
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 100)
        
        return textField
    }()
    
    lazy var datePicker: UIDatePicker = {
        // Set datePicker (default is the position at the top of the screen).
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 200))
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        
        // Register the event when the value changed.
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UITextField on view
        self.view.addSubview(self.textField)
        
        // Add UIDatePicker
        self.view.addSubview(self.datePicker)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when DatePicker is elected.
    @objc func onDidChangeDate(sender: UIDatePicker){
        // Generate the format.
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        
        // Obtain the date according to the format.
        let selectedDate: String = dateFormatter.string(from: sender.date)
        self.textField.text = selectedDate
    }

}
