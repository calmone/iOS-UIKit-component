//
//  AlertVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 2..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class AlertVC: BaseViewController {
    
    // Generate UIButton.
    lazy var button: UIButton = {
        let button: UIButton = UIButton()
        let width: CGFloat = 250
        let height: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width - width)/2
        let posY: CGFloat = 250
        
        button.frame = CGRect(x: posX, y: posY, width: width, height: height)
        button.backgroundColor = UIColor.red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20.0
        button.setTitle("Show UIAlert", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIButton on view
        self.view.addSubview(self.button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button event
    @objc private func buttonPressed(_ sender: Any) {
        appDelegate()?.showAlert(vc: self, title: "Title", message: "Message", actionTitle: "OK", actionStyle: .default)
    }
    
    // Add UIAlertController on UIViewController
    // This function in Appdelegate
//    func showAlert(vc: UIViewController, title: String, message: String, actionTitle: String, actionStyle: UIAlertActionStyle) {
//        // Create a UIAlertController.
//        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        
//        // Create an action of OK.
//        let action = UIAlertAction(title: actionTitle, style: actionStyle) { action in
//            print("Action OK!!")
//        }
//        
//        // Add an Action of OK.
//        alert.addAction(action)
//
//        // Activate UIAlert.
//        vc.present(alert, animated: true, completion: nil)
//    }

}
