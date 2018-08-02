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
        }
    }
    
    static var count: Int { return ComponentList.UIALERTCONTROLLER.hashValue + 1}
}

struct ComponentInfo {
    var name: String
}
