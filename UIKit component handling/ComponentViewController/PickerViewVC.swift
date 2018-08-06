//
//  PickerViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 3..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class PickerViewVC: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    lazy var pickerView: UIPickerView = {
        // Generate UIPickerView.
        let picker = UIPickerView()
        
        // Specify the size.
        picker.frame = CGRect(x: 0, y: 150, width: self.view.bounds.width, height: 180.0)
        
        // Set the background Color.
        picker.backgroundColor = .white
        
        // Set the delegate.
        picker.delegate = self
        
        // Set the dataSource.
        picker.dataSource = self
        
        return picker
    }()
    
    private let values: [String] = ["A","B","C","D","E","F","G","H","I"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIPickerView on view
        self.view.addSubview(self.pickerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Data source method that returns the number of rows to display in the picker.
    // (Implementation required)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    // Delegate method that returns the value to be displayed in the picker.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    // A method called when the picker is selected.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(values[row])")
    }

}
