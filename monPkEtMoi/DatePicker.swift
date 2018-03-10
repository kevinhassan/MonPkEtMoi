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

    func donePressed(){
        self.text = dateFormatter.string(from: datePicker.date)
        self.resignFirstResponder()
    }
}
