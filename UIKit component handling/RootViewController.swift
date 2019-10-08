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
        return ComponentList.COUNT.rawValue
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
            case .UISLIDER: vc = SliderVC(componentName: componentName)
            case .UISWITCH: vc = SwitchVC(componentName: componentName)
            case .UIDATEPICKER: vc = DatePickerVC(componentName: componentName)
            case .UIACTIVITYINDICATOR: vc = ActivityIndicatorVC(componentName: componentName)
            case .UISEARCHBAR: vc = SearchBarVC(componentName: componentName)
            case .UIWINDOW: vc = WindowVC(componentName: componentName)
            case .UITOOLBAR: vc = ToolBarVC(componentName: componentName)
            case .UIPROGRESSVIEW: vc = ProgressVC(componentName: componentName)
            case .UISEGMENTEDCONTROL: vc = SegmentedControlVC(componentName: componentName)
            case .UISTEPPER: vc = StepperVC(componentName: componentName)
            case .UINAVIGATIONBAR: vc = FirstNavigationVC()
            case .ACTIONSHEET: vc = ActionSheetVC(componentName: componentName)
            case .MENUITEM: vc = MenuItemVC(componentName: componentName)
            case .MOTIONEFFECT: vc = MotionEffectVC(componentName: componentName)
            case .UIVISUALEFFECTVIEW: vc = BlurEffectVC(componentName: componentName)
            case .TRANSITIONSVIEW: vc = TransitionsViewVC(componentName: componentName)
            case .TOGGLETOUCH: vc = ToggleTouchVC(componentName: componentName)
            case .LIMITEDUITEXTFIELD: vc = LimitedTextFieldVC(componentName: componentName)
            case .PASSWORDUITEXTFIELD: vc = PasswordTextFieldVC(componentName: componentName)
            case .GESTURE: vc = GestureVC(componentName: componentName)
            case .PASSWORDALERT: vc = PasswordAlertVC(componentName: componentName)
            case .CHARACTERLIMITALERT: vc = CharacterLimitAlertVC(componentName: componentName)
            case .EFFECTPROCESS: vc = EffectProcessVC(componentName: componentName)
            case .SECONDSCREEN: vc = SecondScreenVC(componentName: componentName)
            case .EXTENDINGBUTTONTABLEVIEW: vc = ExtendingButtonTableViewVC(componentName: componentName)
            case .SLIDETABLEVIEW: vc = SlideTableViewVC(componentName: componentName)
            case .SYNCHRONIZESCROLLVIEW: vc = SynchronizeScrollViewVC(componentName: componentName)
            case .ANIMATEBUTTON: vc = AnimateButtonVC(componentName: componentName)
            case .CUSTOMIZEBUTTON: vc = CustomizeButtonVC(componentName: componentName)
            case .DELETEPARTS: vc = DeletePartsVC(componentName: componentName)
            case .ADDDELETETABLEVIEW: vc = AddDeleteTableViewVC(componentName: componentName)
            case .BEZIERPATH: vc = BezierPathVC(componentName: componentName)
            case .UICOLLECTIONVIEW: vc = CollectionViewVC(componentName: componentName)
            case .UICOLLECTIONVIEWCELL: vc = CollectionViewCellVC(componentName: componentName)
            case .UICOLLECTIONVIEWSECTION: vc = SectionCollectionViewVC(componentName: componentName)
            case .UIIMAGEPICKER: vc = ImagePickerVC(componentName: componentName)
            case .TRANSPARENCYIMAGE: vc = TransparencyImageVC(componentName: componentName)
            case .RESIZEIMAGE: vc = ResizeImageVC(componentName: componentName)
            case .COMPOSINGIMAGE: vc = ComposingImageVC(componentName: componentName)
            case .SCREENSHOT: vc = ScreenshotVC(componentName: componentName)
            case .POPOVER: vc = PopoverVC(componentName: componentName)
            case .TEXTCHECKER: vc = TextCheckerVC(componentName: componentName)
            case .ATTACHMENTVIEW: vc = AttachmentVC(componentName: componentName)
            case .GRAVITYVIEW: vc = GravityViewVC(componentName: componentName)
            case .ANIMATIONSUMMARY: vc = AnimationSummaryVC(componentName: componentName)
            case .DRAGVIEW: vc = DragViewVC(componentName: componentName)
            case .MULTIPLEBUTTONS: vc = MultipleButtonsVC(componentName: componentName)
            case .DISPLAYVIEW: vc = DisplayViewVC(componentName: componentName)
            case .PDF: vc = WebPdfVC(componentName: componentName)
            case .PDFFILE: vc = WebPdfFileVC(componentName: componentName)
                
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
