//
//  SecondScreenVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SecondScreenVC: BaseViewController {
    
    var secondWindow: UIWindow!

    lazy var label: UILabel = {
        // Create a label.
        let l: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        l.backgroundColor = UIColor.orange
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 20.0
        l.text = "Hello 1st Screen"
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let screen: [UIScreen] = UIScreen.screens
        
        // If there are two screens being connected, the second one is displayed.
        if screen.count > 1 {
            let screen: UIScreen = UIScreen.screens[1]
            showSecondScreenWindow(screen: screen)
        }
        
        // Notification that occurs when the connection to the screen is lost.
        let defaultCenter: NotificationCenter = NotificationCenter.default
        defaultCenter.addObserver(self, selector: #selector(screenDidConnect(notification:)), name: NSNotification.Name.UIScreenDidConnect, object: nil)
        defaultCenter.addObserver(self, selector: #selector(screenDidDisconnect(notification:)), name: NSNotification.Name.UIScreenDidDisconnect, object: nil)
        defaultCenter.addObserver(self, selector: #selector(screenDidModeChange(notification:)), name: NSNotification.Name.UIScreenModeDidChange, object: nil)
        
        // Add label on view
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When the screen is connected.
    @objc func screenDidConnect(notification: NSNotification){
        print("screenDidConnect")
        let screen: [UIScreen] = UIScreen.screens
        if screen.count > 1 {
            let screen: UIScreen = UIScreen.screens[1]
            showSecondScreenWindow(screen: screen)
        }
    }
    
    // When the screen is disconnected.
    @objc func screenDidDisconnect(notification: NSNotification){
        print("screenDidDisconnect")
    }
    
    // When the screen mode changes.
    @objc func screenDidModeChange(notification: NSNotification){
        print("screenDidModeChange")
    }
    
    // The layout of the screen on the second screen.
    func showSecondScreenWindow(screen: UIScreen!){
        secondWindow = UIWindow()
        secondWindow.screen = screen
        secondWindow.frame = CGRect(x:0, y:0, width:screen.bounds.width, height:screen.bounds.height)
        secondWindow.backgroundColor = UIColor.red
        self.secondWindow.makeKeyAndVisible()
        
        // Create a label.
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.text = "Hello Second Screen"
        label.textColor = UIColor.white
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        label.layer.position = CGPoint(x: self.secondWindow.bounds.width/2, y: 200)
        self.secondWindow.addSubview(label)
    }
    
}
