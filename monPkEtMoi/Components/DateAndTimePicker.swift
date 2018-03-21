//
//  DateAndTimePicker.swift
//  monPkEtMoi
//
//  Created by macOS on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class DateAndTimePicker: UITextField{
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    /// instancier un `DateAndTimePicker`
    ///
    /// La Date et l'heure sous le format Locale fr_FR dd/mm/YYYY et ..h..min
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        self.inputAccessoryView = toolbar
        self.inputView = datePicker
    }
    /// Valider la date et l'heure
    ///
    /// La validation par le bouton "Done" ajoute le texte et ferme le clavier
    func donePressed(){
        self.text = dateFormatter.string(from: datePicker.date)
        self.resignFirstResponder()
    }
    /// Récupérer la date et l'heure
    ///
    /// Prendre la date et l'heure selon le bon format pour l'ajout en BD
    func getDate()->NSDate?{
        return self.dateFormatter.date(from: self.text!)! as NSDate
    }
}

