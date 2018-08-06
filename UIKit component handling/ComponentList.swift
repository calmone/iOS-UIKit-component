//
//  ComponentList.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 27..
//  Copyright © 2018년 calmone. All rights reserved.
//

import Foundation
import UIKit

enum ComponentList: Int {
    case UILABEL = 0
    case UIBUTTON
    case UIBUTTONS
    case UITEXTFIELD
    case UIIMAGEVIEW
    case UIFONT
    case USERNOTIFICATION
    case UIWEBVIEW
    case UIALERTCONTROLLER
    case UIPICKERVIEW
    case UINAVIGATIONCONTROLLER
    case UITABBARCONTROLLER
    case TRANSFORMUIIMAGEVIEW
    case PUSHVIEWCONTROLLER
    case UISCROLLVIEW
    
    func getInfo() -> ComponentInfo {
        switch self {
        case .UILABEL: return ComponentInfo(name: "UILabel")
        case .UIBUTTON: return ComponentInfo(name: "UIButton")
        case .UIBUTTONS: return ComponentInfo(name: "UIButtons")
        case .UITEXTFIELD: return ComponentInfo(name: "UITextField")
        case .UIIMAGEVIEW: return ComponentInfo(name: "UIImageView")
        case .UIFONT: return ComponentInfo(name: "UIFont")
        case .USERNOTIFICATION: return ComponentInfo(name: "UserNotification")
        case .UIWEBVIEW: return ComponentInfo(name: "UIWebView")
        case .UIALERTCONTROLLER: return ComponentInfo(name: "UIAlertController")
        case .UIPICKERVIEW: return ComponentInfo(name: "UIPickerView")
        case .UINAVIGATIONCONTROLLER: return ComponentInfo(name: "UINavigationController")
        case .UITABBARCONTROLLER: return ComponentInfo(name: "UITabBarController")
        case .TRANSFORMUIIMAGEVIEW: return ComponentInfo(name: "TransformUIImageView")
        case .PUSHVIEWCONTROLLER: return ComponentInfo(name: "PushViewController")
        case .UISCROLLVIEW: return ComponentInfo(name: "UIScrollView")
        }
    }
    
    static var count: Int { return ComponentList.UISCROLLVIEW.hashValue + 1}
}

struct ComponentInfo {
    var name: String
}
