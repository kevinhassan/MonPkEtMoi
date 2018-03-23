//
//  DateLabel.swift
//  monPkEtMoi
//
//  Created by macOS on 22/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class DateLabel:UILabel{
    let dateFormatter = DateFormatter()
    
    /// Instancier un `DatePicker`
    ///
    /// Seulement la Date sous le format Locale fr_FR dd/mm/YYYY
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "fr_FR")
    }
    
    /// Appliquer une date au `DatePicker`
    ///
    /// - Parameters:
    ///   - date: `NSDate` date provenant de la BD à appliquer sur le DatePicker
    func setDate(date: NSDate){
        self.dateFormatter.dateFormat = "dd/MM/yyyy"
        self.text = self.dateFormatter.string(for: date)
    }
}
