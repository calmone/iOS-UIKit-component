//
//  PopoverVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 20..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class PopoverVC: BaseViewController {
    
    // Generate Button
    lazy var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        b.layer.position = self.view.center
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 20.0
        b.backgroundColor = UIColor.orange
        b.setTitle("Present!", for: UIControlState.normal)
        b.addTarget(self, action: #selector(onButtonClick(_:)), for: UIControlEvents.touchUpInside)
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onButtonClick(_ sender: UIButton) {
        // Generate ViewController for content.
        let popover = UIViewController()
        
        // Specify the size of the content ViewController.
        popover.preferredContentSize = CGSize(width: 200, height: 200)
        
        // Set the background of the content ViewController to blue.
        popover.view.backgroundColor = UIColor.blue
        popover.modalPresentationStyle = .popover
        
        if let presentationController = popover.popoverPresentationController {
            presentationController.permittedArrowDirections = .any
            presentationController.sourceView = sender
            presentationController.sourceRect = sender.bounds
        }
        
        present(popover, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            popover.dismiss(animated: true, completion: nil)
        }
    }
    
}
