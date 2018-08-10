//
//  FirstNavigationVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class FirstNavigationVC: UIViewController {
    
    lazy var button: UIButton = {
        // Create Button
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        b.backgroundColor = UIColor.orange
        b.layer.masksToBounds = true
        b.setTitle("button", for: .normal)
        b.layer.cornerRadius = 20.0
        b.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        b.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Define the background color of View.
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        // Add button on view
        self.view.addSubview(self.button)
        
        // Create a BarButtonItem.
        let barButton_1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.camera, target: self, action: #selector(onClickBarButton(sender:)))
        let barButton_2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(onClickBarButton(sender:)))
        let barButton_3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(onClickBarButton(sender:)))
        barButton_3.tag = 99
        
        // Store the button to the right of the Bar in the array.
        let rightButtons: [UIBarButtonItem] = [barButton_1, barButton_2]
        
        // Display NavigationBar.
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // Set the title.
        self.navigationItem.title = "First View"
        
        // Set the prompt.
        self.navigationItem.prompt = "Prompt"
        
        // Place multiple on the right side of Bar.
        self.navigationItem.setRightBarButtonItems(rightButtons, animated: true)
        
        // Place it on the left side of Bar.
        self.navigationItem.setLeftBarButton(barButton_3, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when the bar button is pressed
    @objc private func onClickBarButton(sender: UIBarButtonItem) {
        if sender.tag == 99 {
            self.navigationController?.popViewController(animated: true)
        }
        print("onClickBarButton:")
    }
    
    // Called when the button is pressed
    @objc private func onClickButton(sender: UIButton) {
        let secondViewController = SecondNavigationVC()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
