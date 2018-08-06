//
//  UserNotificationVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 1..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotificationVC: BaseViewController, UNUserNotificationCenterDelegate {
    
    private let BUTTON_NORMAL: Int = 1
    private let BUTTON_FIRE: Int = 2
    
    private let width: CGFloat = 200
    private let height: CGFloat = 80
    
    // A button that fires Notification immediately.
    lazy var notificationButton: UIButton = {
        
        let posX: CGFloat = (self.view.bounds.width - width) / 2
        let posY: CGFloat = 200
        
        let button: UIButton = UIButton(frame: CGRect(x: posX, y: posY, width: width, height: height))
        button.backgroundColor = UIColor.orange
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20.0
        button.tag = BUTTON_NORMAL
        button.setTitle("Notification", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        
        return button
    }()
    
    // A button that ignites Notification at time.
    lazy var notificationFireButton: UIButton = {
        let posFireX: CGFloat = (self.view.bounds.width - width) / 2
        let posFireY: CGFloat = 400
        
        let button: UIButton = UIButton(frame: CGRect(x: posFireX, y: posFireY, width: width, height: height))
        button.backgroundColor = UIColor.blue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20.0
        button.tag = BUTTON_FIRE
        button.setTitle("Fire Notification", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Get Notice display permission.
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                if !granted {
                    print("Something went wrong")
                } else {
                    UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                        if settings.authorizationStatus != .authorized {
                            print("Notifications not allowed")
                        }
                    }
                }
            }
            UNUserNotificationCenter.current().delegate = self
        } else {
            // Fallback on earlier versions
            let notificationSettings = UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notificationSettings)
            
        }
        
        //        DispatchQueue.main.async {
        //            UIApplication.shared.registerForRemoteNotifications()
        //        }
        
        
        // Add UIButtons on view
        self.view.addSubview(self.notificationButton)
        self.view.addSubview(self.notificationFireButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func buttonPressed(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.tag == BUTTON_NORMAL {
                showNotification()
            } else if button.tag == BUTTON_FIRE {
                showNotificationFire()
            } else {
                return
            }
        }
    }
    
    // Display Notification.
    private func showNotification() {
        print("showNotification")
        if #available(iOS 10.0, *) {
            // Generate Notification.
            let content = UNMutableNotificationContent()
            
            // Substitute Title.
            content.title = "showNotification"
            
            // Assign Body.
            content.body = "Hello calmone"
            
            // Set the sound.
            content.sound = UNNotificationSound.default()
            
            // Generate a Request.
            let request = UNNotificationRequest.init(identifier: "notification1", content: content, trigger: nil)
            
            // issue a Notification.
            UNUserNotificationCenter.current().add(request) { (error) in
                print(error?.localizedDescription ?? "")
            }
        } else {
            // Fallback on earlier versions
            
            // Generate Notification.
            let notification = UILocalNotification()
            
            // Substitute Title.
            notification.alertTitle = "showNotification"
            
            // Assign Body.
            notification.alertBody = "Hello calmone"
            
            // Set the sound.
            notification.soundName = UILocalNotificationDefaultSoundName
            
            // issue a Notification.
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
    
    // Display Notification (after 10 seconds)
    private func showNotificationFire() {
        print("showNotificationFire")
        if #available(iOS 10.0, *) {
            // Generate Notification.
            let content = UNMutableNotificationContent()
            
            // Substitute Title.
            content.title = "showNotificationFire"
            
            // Assign Body.
            content.body = "Hello calmone"
            
            // Set the sound.
            content.sound = UNNotificationSound.default()
            
            // Generate Trigger.
            let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
            
            // Generate a Request.
            let request = UNNotificationRequest.init(identifier: "notification2", content: content, trigger: trigger)
            
            // issue a Notification.
            UNUserNotificationCenter.current().add(request) { (error) in
                print(error?.localizedDescription ?? "")
            }
        } else {
            // Fallback on earlier versions
            
            // Generate Notification.
            let notification = UILocalNotification()
            
            // Substitute Title.
            notification.alertTitle = "showNotification"
            
            // Assign Body.
            notification.alertBody = "Hello calmone"
            
            // Set the sound.
            notification.soundName = UILocalNotificationDefaultSoundName
            
            // Generate Trigger.
            notification.fireDate = Date(timeIntervalSinceNow: 5)
            
            // issue a Notification.
            UIApplication.shared.scheduleLocalNotification(notification)
        }
        
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .alert, .sound])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
