//
//  ActionSheetVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ActionSheetVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Generate action.
        let action_1 = UIAlertAction(title: "Hello", style: UIAlertActionStyle.default) { (_) in
            print("Hello")
        }
        let action_2 = UIAlertAction(title: "yes", style: UIAlertActionStyle.default) { (_) in
            print("yes")
        }
        let action_3 = UIAlertAction(title: "no", style: UIAlertActionStyle.default) { (_) in
            print("no")
        }
        
        let actionArray: [UIAlertAction] = [action_1, action_2, action_3]
        
        appDelegate()?.showActionSheetAlert(vc: self, title: "Title", message: "Message", actions: actionArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
