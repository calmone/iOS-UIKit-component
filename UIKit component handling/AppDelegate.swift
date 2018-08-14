//
//  AppDelegate.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 27..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var effectView: UIView!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        makeEffectView()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        removeEffectView()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
}

extension AppDelegate {
    
    private func makeEffectView() {
        let effect: UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
        self.window?.addSubview(effectView)
    }
    
    private func removeEffectView() {
        if effectView != nil {
            self.effectView.removeFromSuperview()
        }
    }
    
    // Add UIAlertController on UIViewController
    func showAlert(vc: UIViewController, title: String, message: String, actionTitle: String, actionStyle: UIAlertActionStyle) {
        // Create a UIAlertController.
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create an action of OK.
        let action = UIAlertAction(title: actionTitle, style: actionStyle) { action in
            print("Action OK!!")
        }
        
        // Add an Action of OK.
        alert.addAction(action)
        
        // Activate UIAlert.
        vc.present(alert, animated: true, completion: nil)
    }
    
    // Add ActionSheet display with UIAlertController on UIViewController
    func showActionSheetAlert(vc: UIViewController, title: String, message: String, actions: [UIAlertAction]) {
        // Create a UIAlertController.
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // Add action.
        for action in actions {
            alert.addAction(action)
        }
        
        // Activate UIAlert.
        vc.present(alert, animated: true, completion: nil)
    }
    
}
