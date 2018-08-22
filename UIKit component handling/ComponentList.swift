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
    case UIBARBUTTONITEM
    case UIPAGECONTROL
    case SECTIONUITABLEVIEW
    case UITEXTVIEW
    case UISLIDER
    case UISWITCH
    case UIDATEPICKER
    case UIACTIVITYINDICATOR
    case UISEARCHBAR
    case UIWINDOW
    case UITOOLBAR
    case UIPROGRESSVIEW
    case UISEGMENTEDCONTROL
    case UISTEPPER
    case UINAVIGATIONBAR
    case ACTIONSHEET
    case MENUITEM
    case MOTIONEFFECT
    case UIVISUALEFFECTVIEW
    case TRANSITIONSVIEW
    case TOGGLETOUCH
    case LIMITEDUITEXTFIELD
    case PASSWORDUITEXTFIELD
    case GESTURE
    case PASSWORDALERT
    case CHARACTERLIMITALERT
    case EFFECTPROCESS
    case SECONDSCREEN
    case EXTENDINGBUTTONTABLEVIEW
    case SLIDETABLEVIEW
    case SYNCHRONIZESCROLLVIEW
    case ANIMATEBUTTON
    case CUSTOMIZEBUTTON
    case DELETEPARTS
    case ADDDELETETABLEVIEW
    case BEZIERPATH
    case UICOLLECTIONVIEW
    case UICOLLECTIONVIEWCELL
    case UICOLLECTIONVIEWSECTION
    case UIIMAGEPICKER
    case TRANSPARENCYIMAGE
    case RESIZEIMAGE
    case COMPOSINGIMAGE
    case SCREENSHOT
    case POPOVER
    case TEXTCHECKER
    case ATTACHMENTVIEW
    case GRAVITYVIEW
    case ANIMATIONSUMMARY
    case DRAGVIEW
    case MULTIPLEBUTTONS
    case DISPLAYVIEW
    case PDF
    case PDFFILE
    
    /* Don't use */
    case COUNT
    
    func getInfo() -> ComponentInfo {
        switch self {
        case .UILABEL: return ComponentInfo(name: "UILabel")
        case .UIBUTTON: return ComponentInfo(name: "UIButton")
        case .UIBUTTONS: return ComponentInfo(name: "Various UIButtons")
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
        case .UIBARBUTTONITEM: return ComponentInfo(name: "UIBarButtonItem")
        case .UIPAGECONTROL: return ComponentInfo(name: "UIPageControl")
        case .SECTIONUITABLEVIEW: return ComponentInfo(name: "UITableView Section")
        case .UITEXTVIEW: return ComponentInfo(name: "UITextView")
        case .UISLIDER: return ComponentInfo(name: "UISlider")
        case .UISWITCH: return ComponentInfo(name: "UISwitch")
        case .UIDATEPICKER: return ComponentInfo(name: "UIDatePicker")
        case .UIACTIVITYINDICATOR: return ComponentInfo(name: "UIActivityIndicator")
        case .UISEARCHBAR: return ComponentInfo(name: "UISearchBar")
        case .UIWINDOW: return ComponentInfo(name: "UIWindow")
        case .UITOOLBAR: return ComponentInfo(name: "UIToolBar")
        case .UIPROGRESSVIEW: return ComponentInfo(name: "UIProgressView")
        case .UISEGMENTEDCONTROL: return ComponentInfo(name: "UISegmentedControl")
        case .UISTEPPER: return ComponentInfo(name: "UIStepper")
        case .UINAVIGATIONBAR: return ComponentInfo(name: "UINavigationBar")
        case .ACTIONSHEET: return ComponentInfo(name: "ActionSheet")
        case .MENUITEM: return ComponentInfo(name: "MenuItem")
        case .MOTIONEFFECT: return ComponentInfo(name: "UIMotionEffect")
        case .UIVISUALEFFECTVIEW: return ComponentInfo(name: "UIVisualEffectView")
        case .TRANSITIONSVIEW: return ComponentInfo(name: "TransitionsView")
        case .TOGGLETOUCH: return ComponentInfo(name: "ToggleTouchEvent")
        case .LIMITEDUITEXTFIELD: return ComponentInfo(name: "Limited UITextField")
        case .PASSWORDUITEXTFIELD: return ComponentInfo(name: "Password UITextField")
        case .GESTURE: return ComponentInfo(name: "GestureRecognizer")
        case .PASSWORDALERT: return ComponentInfo(name: "Password UIAlertViewController")
        case .CHARACTERLIMITALERT: return ComponentInfo(name: "Character limit UIAlertViewController")
        case .EFFECTPROCESS: return ComponentInfo(name: "Effect processing")
        case .SECONDSCREEN: return ComponentInfo(name: "Second screen")
        case .EXTENDINGBUTTONTABLEVIEW: return ComponentInfo(name: "Extending button UITableView")
        case .SLIDETABLEVIEW: return ComponentInfo(name: "Slide UITableView")
        case .SYNCHRONIZESCROLLVIEW: return ComponentInfo(name: "Synchronize UIScrollView")
        case .ANIMATEBUTTON: return ComponentInfo(name: "Animate UIButton")
        case .CUSTOMIZEBUTTON: return ComponentInfo(name: "Customize UIButton")
        case .DELETEPARTS: return ComponentInfo(name: "Delete UI Parts")
        case .ADDDELETETABLEVIEW: return ComponentInfo(name: "Add/Delete UITableView")
        case .BEZIERPATH: return ComponentInfo(name: "UIBezierPath")
        case .UICOLLECTIONVIEW: return ComponentInfo(name: "UICollectionView")
        case .UICOLLECTIONVIEWCELL: return ComponentInfo(name: "UICollectionView Customize")
        case .UICOLLECTIONVIEWSECTION: return ComponentInfo(name: "UICollectionView Section")
        case .UIIMAGEPICKER: return ComponentInfo(name: "UIImagePickerController")
        case .TRANSPARENCYIMAGE: return ComponentInfo(name: "Transparency of images")
        case .RESIZEIMAGE: return ComponentInfo(name: "Resize UIImage")
        case .COMPOSINGIMAGE: return ComponentInfo(name: "Composing UIImage")
        case .SCREENSHOT: return ComponentInfo(name: "Screenshot")
        case .POPOVER: return ComponentInfo(name: "UIPopoverController")
        case .TEXTCHECKER: return ComponentInfo(name: "UITextChecker")
        case .ATTACHMENTVIEW: return ComponentInfo(name: "Attachment UIView")
        case .GRAVITYVIEW: return ComponentInfo(name: "Gravity UIView")
        case .ANIMATIONSUMMARY: return ComponentInfo(name: "UIView animation summary")
        case .DRAGVIEW: return ComponentInfo(name: "Dragging UIView")
        case .MULTIPLEBUTTONS: return ComponentInfo(name: "Make multiple UIButtons")
        case .DISPLAYVIEW: return ComponentInfo(name: "Hide/Show UIView")
        case .PDF: return ComponentInfo(name: "Open PDF with UIWebView")
        case .PDFFILE: return ComponentInfo(name: "Open local PDF with UIWebView")
            
        /* Don't use */
        case .COUNT: return ComponentInfo(name: "Count")
        }
    }
    
}

struct ComponentInfo {
    var name: String
}
