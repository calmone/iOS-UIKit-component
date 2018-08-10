//
//  SecondViewController.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 3..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the controller's title.
        self.navigationItem.prompt = "Second View"
        
        // Set the background color of the view to Cyan.
        self.view.backgroundColor = .green

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
