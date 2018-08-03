//
//  SecondTabBarViewController.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 3..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SecondTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Set the background color of the view to Green.
        self.view.backgroundColor = .green
        
        // Define the tabBarItem's icon as Featured and Tag as 2.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
