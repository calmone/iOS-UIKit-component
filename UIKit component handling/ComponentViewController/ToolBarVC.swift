//
//  ToolBarVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ToolBarVC: BaseViewController {

    private let toolBarHeight: CGFloat = 44
    
    lazy var toolBar: UIToolbar = {
        // Decide the size of the toolbar.
        let tb = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.size.height - toolBarHeight, width: self.view.bounds.size.width, height: 40.0))
        
        // Determine the position of the toolbar.
        tb.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        
        // Decide the color of the toolbar.
        tb.barStyle = .blackTranslucent
        tb.tintColor = UIColor.white
        tb.backgroundColor = UIColor.black
        
        return tb
    }()
    
    lazy var barButtonGreen: UIBarButtonItem = {
        // Generate button 1.
        let b: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.plain, target: self, action: #selector(onClickBarButton(sender:)))
        b.tag = 1
        
        return b
    }()
    
    lazy var barButtonBlue: UIBarButtonItem = {
        // Generate button 2.
        let b: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.plain, target: self, action: #selector(onClickBarButton(sender:)))
        b.tag = 2
        
        return b
    }()
    
    lazy var barButtonRed: UIBarButtonItem = {
        // Generate button 3.
        let b: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.plain, target: self, action: #selector(onClickBarButton(sender:)))
        b.tag = 3
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Place the button in the tool bar.
        self.toolBar.items = [self.barButtonGreen, self.barButtonBlue, self.barButtonRed]
        
        // Add UIToolBar on view
        self.view.addSubview(self.toolBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when UIBarButtonItem is pressed.
    @objc func onClickBarButton(sender: UIBarButtonItem) {
        switch sender.tag {
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.blue
        case 3:
            self.view.backgroundColor = UIColor.red
        default: return
        }
    }

}
