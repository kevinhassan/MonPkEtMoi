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
        print(week)
        return week
    }
}
