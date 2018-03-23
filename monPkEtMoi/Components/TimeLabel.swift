//
//  TimeLabel.swift
//  monPkEtMoi
//
//  Created by macOS on 22/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class TimeLabel: UILabel{
    let dateFormatter = DateFormatter()
    
    /// Instancier un `TimePicker`
    ///
    /// Seulement l'heure sous le format Locale fr_FR "..h..min"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
    }
    /// Insérer l'heure
    ///
    func setDate(heure: NSDate){
        self.text = dateFormatter.string(from: heure as Date)
        self.resignFirstResponder()
    }
}
