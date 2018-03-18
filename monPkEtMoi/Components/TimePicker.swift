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
    
    func donePressed(){
        self.text = dateFormatter.string(from: datePicker.date)
        self.resignFirstResponder()
    }
    func getDate()->NSDate{
        return self.dateFormatter.date(from: self.text!)! as NSDate
    }
}
