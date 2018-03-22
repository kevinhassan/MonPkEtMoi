//
//  CountdownPicker.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 10/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

class CountDownPicker: UITextField{
    let timePicker = UIDatePicker()
    let timeFormatter = DateFormatter()
    
    /// Instancier un `CountDownPicker`
    ///
    /// Seulement l'heure et les minutes sous le format Locale fr_FR "..h..min"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        timePicker.datePickerMode = .countDownTimer
        timePicker.locale = Locale(identifier: "fr_FR")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        self.inputAccessoryView = toolbar
        self.inputView = timePicker
    }
    
    /// Valider le compteur
    ///
    /// La validation par le bouton "Done" ajoute le texte en unité : **Minute**
    func donePressed(){
        self.text = "\(Int(timePicker.countDownDuration/60))"
        self.resignFirstResponder()
    }
}
