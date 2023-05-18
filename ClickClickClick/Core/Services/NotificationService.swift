//
//  NotificationService.swift
//  ClickClickClick
//
//  Created by Максим Косников on 18.05.2023.
//

import Foundation
import UserNotifications

class NotificationService: NSObject {
    
    private override init() { }
    static let sharedInstance = NotificationService()
    
    let UNCurrentCenter = UNUserNotificationCenter.current()
    
    func authorizeNotification() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNCurrentCenter.requestAuthorization(options: options) { granted, error in
            if let error = error {
                print(error)
            } else {
                print("NoUNAuthorization error")
            }
            
            guard granted else {
                print("User Denied the permission to recieve Push")
                return
            }
            
            self.UNCurrentCenter.delegate = self
        }
    }
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Уведомление"
        notificationContent.badge = NSNumber(value: 3)
        
        if let url = Bundle.main.url(forResource: "dune",
                                    withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                            url: url,
                                                            options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        UNCurrentCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
}

extension NotificationService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didReceive response")
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("willPresent notification")
        
        let options: UNNotificationPresentationOptions = [.banner, .sound]
        completionHandler(options)
    }
}
