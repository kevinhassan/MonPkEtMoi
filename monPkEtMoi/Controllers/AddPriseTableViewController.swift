//
//  addPriseTableViewController.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddPriseTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var medicamentTF: UITextField!
    @IBOutlet weak var dateDebut: DatePicker!
    @IBOutlet var jours: [UISwitch]!
    
    @IBAction func addPrise(_ sender: Any) {

    }
    var medicaments: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        medicamentTF.inputAccessoryView = toolbar
        medicamentTF.inputView = typePicker
        do{
            let medocs: [Medicament] = try Medicament.getAll()
            medicaments = medocs.map({ (medoc: Medicament) -> String in
                return medoc.nom!
            })
            medicaments?.insert("", at: 0)
        }catch{
        }
    }

    func donePressed(){
        medicamentTF.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerView Delegation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return medicaments!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return medicaments?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        medicamentTF.text = medicaments?[row]
    }
}
