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
        return ComponentList.COUNT.hashValue
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let component = ComponentList.init(rawValue: indexPath.row) {
            var vc: UIViewController!
            let componentName = component.getInfo().name
            
            switch component {
            case .UILABEL: vc = LabelVC(componentName: componentName)
            case .UIBUTTON: vc = ButtonVC(componentName: componentName)
            case .UIBUTTONS: vc = ButtonsVC(componentName: componentName)
            case .UITEXTFIELD: vc = TextFieldVC(componentName: componentName)
            case .UIIMAGEVIEW: vc = ImageViewVC(componentName: componentName)
            case .UIFONT: vc = FontVC(componentName: componentName)
            case .USERNOTIFICATION: vc = UserNotificationVC(componentName: componentName)
            case .UIWEBVIEW: vc = WebViewVC(componentName: componentName)
            case .UIALERTCONTROLLER: vc = AlertVC(componentName: componentName)
            case .UIPICKERVIEW: vc = PickerViewVC(componentName: componentName)
            case .UINAVIGATIONCONTROLLER: vc = FirstViewController()
            case .UITABBARCONTROLLER: vc = RootTabBarViewController()
            case .TRANSFORMUIIMAGEVIEW: vc = TransformImageViewVC(componentName: componentName)
            case .PUSHVIEWCONTROLLER: vc = PushFirstVC(componentName: "FirstVC")
            case .UISCROLLVIEW: vc = ScrollViewVC(componentName: componentName)
            case .UIBARBUTTONITEM: vc = BarButtonItemVC()
            case .UIPAGECONTROL: vc = PageControlVC(componentName: componentName)
            case .SECTIONUITABLEVIEW: vc = SectionTableViewVC(componentName: componentName)
            case .UITEXTVIEW: vc = TextViewVC(componentName: componentName)
                
                
                /* Don't use */
            case .COUNT: return
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
