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
            
    
    init(type: TypeNotification){
        var title: String
        var subtitle: String
        var body: String
        switch type {
        case .Prise:
            title = "Rappel prise"
            subtitle = ""
            body = "Vous devez prendre votre médicament maintenant"
        case .RDV:
            title = "Rappel Rendez-vous"
            subtitle = ""
            body = "Vous n'allez pas tarder à aller à vôtre rendez-vous"
        case .Activite:
            title = "Rappel Activité"
            subtitle = ""
            body = "L'activité ajoutée démarre maintenant"
        case .Tracker:
            title = "Rappel Tracker"
            subtitle = ""
            body = "Vous devez répondre au questionnaire"
        }
        self.content = UNMutableNotificationContent()
        self.content.title = title
        self.content.subtitle = subtitle
        self.content.body = body
        self.identifier = UUID().uuidString
        self.content.badge = 1
    }
    func setTime(timeInterval: TimeInterval){
        self.trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        self.request = UNNotificationRequest(identifier: self.identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request!, withCompletionHandler: nil)
    }
}

enum TypeNotification{
    case Prise, RDV, Activite, Tracker
}
