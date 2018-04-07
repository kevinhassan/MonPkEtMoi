//
//  TimePicker.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class TimePicker: UITextField {

    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    /// Instancier un `TimePicker`
    ///
    /// Seulement l'heure sous le format Locale fr_FR "..h..min"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "fr_FR")
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        self.inputAccessoryView = toolbar
        self.inputView = datePicker
    }
    /// Valider l'heure
    ///
    /// La validation par le bouton "Done" ajoute le texte et ferme le clavier
    func donePressed(){
        self.text = dateFormatter.string(from: datePicker.date)
        self.resignFirstResponder()
    }
    /// Récupérer l'heure
    ///
    /// Prendre l'heure selon le bon format pour l'ajout en BD
    func getDate()->NSDate?{
        guard let date = self.dateFormatter.date(from: self.text!) else{
            return nil
        }
        return date as NSDate
    }
    /// Insérer l'heure
    ///
    func setDate(heure: NSDate){
        self.text = dateFormatter.string(from: heure as Date)
        self.resignFirstResponder()
    }
}
