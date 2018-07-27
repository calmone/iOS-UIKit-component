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
        return tableView.frame.size.height / 9.5
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
            self.navigationController?.pushViewController(component.getInfo().viewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uikitCell", for: indexPath)
        
        if let component = ComponentList.init(rawValue: indexPath.row) {
            cell.textLabel?.text = component.getInfo().name
        }
        
        return cell
    }
    
}

extension RootViewController {
    
    enum ComponentList: Int {
        case LABEL = 0
        case BUTTON
        
        func getInfo() -> ComponentInfo {
            switch self {
            case .LABEL:
                return ComponentInfo(name: "Lable", viewController: LabelViewController())
            case .BUTTON:
                return ComponentInfo(name: "Button", viewController: ButtonViewController())
            }
        }
        
        static var count: Int { return ComponentList.BUTTON.hashValue + 1}
    }
    
    struct ComponentInfo {
        var name: String
        var viewController: UIViewController
    }
    
}
