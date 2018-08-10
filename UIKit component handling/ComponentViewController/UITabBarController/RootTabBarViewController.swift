//
//  RootTabBarViewController.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 3..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the controller's title.
        self.navigationItem.prompt = "UITabBarController"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Generate an instance of the ViewController to set on the Tab.
        let firstTab: UIViewController = FirstTabBarViewController()
        let secondTab: UIViewController = SecondTabBarViewController()
        
        // Create an Array of Tables with Tabs as Elements.
        let tabs = NSArray(objects: firstTab, secondTab)
        
        // Set the ViewController.
        self.setViewControllers(tabs as? [UIViewController], animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
