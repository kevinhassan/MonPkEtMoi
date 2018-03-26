//
//  DateHelper.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class DateHelper{
    static var cal = NSCalendar.current
    static var days = NSDateComponents()

    static func getDates(dateD: NSDate, dateF: NSDate) -> [NSDate]{

        var dates: [NSDate] = []
        var dayCount = 0
        while true {
            days.day = dayCount
            let date:NSDate = cal.date(byAdding : days as DateComponents, to: dateD as Date)! as NSDate
            if date.compare(dateF as Date) == .orderedDescending {
                break
            }
            dayCount += 1
            dates.append(date)
        }
        return dates
    }
    static func getDays(dateD: NSDate, dateF: NSDate) -> [[NSDate]?]{
        var week:[[NSDate]] = [[],[],[],[],[],[],[]]
        let dates:[NSDate] = DateHelper.getDates(dateD: dateD, dateF: dateF)
        var numJour: Int? = nil
        for date in dates{
            // Numéroté de 1 à 7
            numJour = cal.component(.weekday, from: date as Date)
            week[Jour().getJourIndex(jour:numJour!)].append(date)
        }
        return week
    }
    /// Changer une date en lui affectant une nouvelle heure et de nouvelle minute
    static func changeHour(date: NSDate, heureMin: NSDate) -> NSDate{
        var component1 = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date as Date)
        var component2 = cal.dateComponents([.hour, .minute, .second], from: heureMin as Date)
        component1.hour = component2.hour
        component1.minute = component2.minute
        component1.second = component2.second
        let date = cal.date(from: component1)!
        return date as NSDate
    }
    
    static func startOfDay(day: NSDate) -> NSDate {
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let unitFlags: NSCalendar.Unit = [.minute, .hour, .day, .month, .year]
        var todayComponents = gregorian!.components(unitFlags, from: day as Date)
        todayComponents.hour = 0
        todayComponents.minute = 0
        return (gregorian?.date(from: todayComponents))! as NSDate
    }
    
    static func endOfDay(day: NSDate) -> NSDate {
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let unitFlags: NSCalendar.Unit = [.minute, .hour, .day, .month, .year]
        var todayComponents = gregorian!.components(unitFlags, from: day as Date)
        todayComponents.hour = 23
        todayComponents.minute = 59
        return (gregorian?.date(from: todayComponents))! as NSDate
    }
    static func checkInterval(heureDebut: NSDate, heureFin: NSDate, intervalle: Int){
        
    }
    
}
