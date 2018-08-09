//
//  TextViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class TextViewVC: BaseViewController {
    
    lazy var textView: UITextView = {
        // Create a TextView.
        let textView: UITextView = UITextView(frame: CGRect(x:10, y:100, width:self.view.frame.width - 20, height:400))
        
        // Set the background of TextView to Orange.
        textView.backgroundColor = .orange
        
        // Set the text to be displayed.
        textView.text = "asdlfkjslkdfion1230914098snflsdfn98123n 1234567890 fbaiwerp[q;afnm,vjjsdfa \na\nb\nc\ndefghijklmnopqrstuwxyz \n https://medium.com/@calmone"
        
        // Round the corners.
        textView.layer.masksToBounds = true
        
        // Set the size of the roundness.
        textView.layer.cornerRadius = 20.0
        
        // Set the thickness of the border.
        textView.layer.borderWidth = 1
        
        // Set the border color to black.
        textView.layer.borderColor = UIColor.black.cgColor
        
        // Set the font.
        textView.font = UIFont.systemFont(ofSize: 20.0)
        
        // Set font color.
        textView.textColor = UIColor.black
        
        // Set left justified.
        textView.textAlignment = NSTextAlignment.left
        
        // Automatically detect links, dates, etc. and convert them to links.
        textView.dataDetectorTypes = UIDataDetectorTypes.all
        
        // Set shadow darkness.
        textView.layer.shadowOpacity = 0.5
        
        // Make text uneditable.
        textView.isEditable = false
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UITextView on view
        self.view.addSubview(self.textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
