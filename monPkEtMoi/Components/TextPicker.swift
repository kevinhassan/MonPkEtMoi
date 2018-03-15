//
//  TextPicker.swift
//  monPkEtMoi
//
//  Created by macOS on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//
import Foundation
import UIKit

class TextPicker: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    var content: [String] = []

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let pickerView = UIPickerView()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        self.inputAccessoryView = toolbar
        self.inputView = pickerView
        self.textAlignment = .right
    }
    func donePressed(){
        self.text = ""
        self.resignFirstResponder()
    }
    func setContent(array: [String]) -> Void{
        self.content = array
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        print("gello")
        return self.content.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.content[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = self.content[row]
    }
}
