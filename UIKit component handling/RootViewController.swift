//
//  ViewController.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 27..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 11.5
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ComponentList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let component = ComponentList.init(rawValue: indexPath.row) {
            var vc: UIViewController!
            let componentName = component.getInfo().name
            
            switch component {
            case .UILABEL: vc = LabelViewController(componentName: componentName)
            case .UIBUTTON: vc = ButtonViewController(componentName: componentName)
            case .UIBUTTONS: vc = ButtonsViewController(componentName: componentName)
            case .UITEXTFIELD: vc = TextFieldViewController(componentName: componentName)
            case .UIIMAGEVIEW: vc = ImageViewViewController(componentName: componentName)
            case .UIFONT: vc = FontViewController(componentName: componentName)
            case .USERNOTIFICATION: vc = UserNotificationViewController(componentName: componentName)
            case .UIWEBVIEW: vc = WebViewViewController(componentName: componentName)
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uikitCell", for: indexPath)
        
        if let component = ComponentList.init(rawValue: indexPath.row) {
            let componentName: String = component.getInfo().name
            cell.textLabel?.text = componentName
        }
        
        return cell
    }
    
}
