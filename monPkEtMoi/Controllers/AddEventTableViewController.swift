//
//  AddEventTableViewController.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddEventTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var dateEvent: DateAndTimePicker!
    @IBOutlet weak var typeEvent: UITextField!
    @IBOutlet weak var descriptionEvent: UITextField!
    
    let typeEventDAO = CoreDataDAOFactory.getInstance().getTypeEvenementDAO()
    let eventDAO = CoreDataDAOFactory.getInstance().getEvenementDAO()

    @IBAction func addEvent(_ sender: Any) {
        let inputs:[String: UITextField] = ["dateEvent": dateEvent,"typeEvent": typeEvent]
        if(FormValidatorHelper.validateForm(inputs)){
            saveNewEvent(withDate: dateEvent.getDate()!, withType: typeEvent.text!, withDescription: descriptionEvent.text ?? "")
            DialogBoxHelper.alert(view: self, WithTitle: "Ajout réussi", andMessage: "Evenement ajouté", closure: { (action) in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePatient") as! HomePatientViewController
                self.present(vc, animated: true, completion: nil)
            })
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    var typesEvenement: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        typeEvent.inputAccessoryView = toolbar
        typeEvent.inputView = typePicker
        do{
            let typesEv: [TypeEvenement] = try typeEventDAO.getAll()!
            typesEvenement = typesEv.map({ (typeEvenement: TypeEvenement) -> String in
                return typeEvenement.libelleEvenement!
            })
            typesEvenement?.insert("", at: 0)
        }catch{
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed(){
        typeEvent.resignFirstResponder()
    }
    
    func saveNewEvent(withDate date: NSDate, withType type: String, withDescription description: String){
        let newEvent: Evenement = eventDAO.create()
        newEvent.date = date
        newEvent.hasType?.libelleEvenement = type
        newEvent.descriptionEvenement = description
        do{
            try eventDAO.save(evenement: newEvent)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    // MARK: UIPickerView Delegation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesEvenement!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesEvenement?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeEvent.text = typesEvenement?[row]
    }
}
