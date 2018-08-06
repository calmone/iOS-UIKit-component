//
//  ButtonsVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 30..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ButtonsVC: BaseViewController {
    
    lazy var infoDarkButton: UIButton = {
        // Generate button.
        let button = UIButton(type: .infoDark)
        
        // Specify the position of the button.
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        
        // Tag a button.
        button.tag = 1
        
        // Add an event.
        button.addTarget(self, action: #selector(onClickButtons(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var infoLightButton: UIButton = {
        // Generate button.
        let button = UIButton(type: .infoLight)
        
        // Specify the position of the button.
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: 250)
        
        // Tag a button.
        button.tag = 2
        
        // Add an event.
        button.addTarget(self, action: #selector(onClickButtons(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: UIButton = {
        // Generate button.
        let button = UIButton(type: .contactAdd)
        
        // Specify the position of the button.
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: 300)
        
        // Tag a button.
        button.tag = 3
        
        // Add an event.
        button.addTarget(self, action: #selector(onClickButtons(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var detailButton: UIButton = {
        // Generate button.
        let button = UIButton(type: .detailDisclosure)
        
        // Specify the position of the button.
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: 350)
        
        // Tag a button.
        button.tag = 4
        
        // Add an event.
        button.addTarget(self, action: #selector(onClickButtons(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var systemButton: UIButton = {
        // Generate button.
        let button = UIButton(type: .system)
        
        // Define the size of the button.
        let width: CGFloat = 200
        let height: CGFloat = 50
        
        // Specify the position of the button.
        let posX: CGFloat = self.view.frame.width/2 - width/2
        let posY: CGFloat = 400
        
        // Tag a button.
        button.tag = 5
        
        // Set the button installation coordinates and size.
        button.frame = CGRect(x: posX, y: posY, width: width, height: height)
        
        // Set the title (normal).
        button.setTitle("systemButton", for: .normal)
        
        // Add an event.
        button.addTarget(self, action: #selector(onClickButtons(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIButtons to view.
        self.view.addSubview(self.infoDarkButton)
        self.view.addSubview(self.infoLightButton)
        self.view.addSubview(self.addButton)
        self.view.addSubview(self.detailButton)
        self.view.addSubview(self.systemButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event.
    @objc private func onClickButtons(_ sender: Any) {
        if let button = sender as? UIButton {
            print("onClickButton");
            print("button.currentTitle: \((button.currentTitle) ?? "Empty")")
            print("button.tag: \(button.tag)")
        }
    }

}
