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
    case LABEL = 0
    case BUTTON
    
    func getInfo() -> ComponentInfo {
        switch self {
        case .LABEL:
            return ComponentInfo(name: "Lable")
        case .BUTTON:
            return ComponentInfo(name: "Button")
        }
    }
    
    static var count: Int { return ComponentList.BUTTON.hashValue + 1}
}

struct ComponentInfo {
    var name: String
}
