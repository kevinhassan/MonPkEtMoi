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
    @IBOutlet weak var nbMedicamentTF: UITextField!
    @IBOutlet var jours: [UISwitch]!
    @IBOutlet weak var dosageLabel: UILabel!
    
    let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()
    let posologieDAO = CoreDataDAOFactory.getInstance().getPosologieDAO()

    var medocs: [Medicament] = []

    @IBAction func addPrise(_ sender: Any) {
        
    }

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
            medocs = (try medicamentDAO.getAll())!
        }catch{
        }
        dateDebut.setDate(date: NSDate())
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
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return medocs.count
        }else{
            let medicamentSelected = pickerView.selectedRow(inComponent: 0)
            return medocs[medicamentSelected].dosageMedicament!.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return medocs[row].nomMedicament
        }else{
            let medicamentSelected = pickerView.selectedRow(inComponent: 0)
            return medocs[medicamentSelected].dosageMedicament![row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        medicamentTF.text = medocs[pickerView.selectedRow(inComponent: 0)].nomMedicament!
        dosageLabel.text = medocs[pickerView.selectedRow(inComponent: 0)].dosageMedicament![pickerView.selectedRow(inComponent: 1)]
    }
}
