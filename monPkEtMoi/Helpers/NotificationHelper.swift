//
//  NotificationHelper.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationHelper{
    let content: UNMutableNotificationContent
    var trigger: UNTimeIntervalNotificationTrigger?
    var request: UNNotificationRequest?
    let identifier: String
    
    static func authorizeNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {(success, error) in
        })
    }
            
    
    init(title: String, subtitle: String, body: String, identifier: String){
        self.content = UNMutableNotificationContent()
        self.content.title = title
        self.content.subtitle = subtitle
        self.content.body = body
        self.identifier = identifier
    }
    func setTime(timeInterval: TimeInterval){
        self.trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        self.request = UNNotificationRequest(identifier: self.identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request!, withCompletionHandler: nil)
    }
}
