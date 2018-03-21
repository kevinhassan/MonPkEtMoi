//
//  DatePicker.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 10/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class DatePicker: UITextField{
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    /// Instancier un `DatePicker`
    ///
    /// Seulement la Date sous le format Locale fr_FR dd/mm/YYYY
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "fr_FR")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        self.inputAccessoryView = toolbar
        self.inputView = datePicker
    }
    /// Valider la date
    ///
    /// La validation par le bouton "Done" ajoute le texte et ferme le clavier
    func donePressed(){
        self.text = dateFormatter.string(from: datePicker.date)
        self.resignFirstResponder()
    }
    /// Récupérer la date
    ///
    /// Prendre la date selon le bon format pour l'ajout en BD
    func getDate()->NSDate?{
        return self.dateFormatter.date(from: self.text!)! as NSDate
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
