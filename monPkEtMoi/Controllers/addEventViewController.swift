//
//  AddEventViewController.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddEventViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var dateEvent: DateAndTimePicker!
    @IBOutlet weak var typeEvent: UITextField!
    @IBOutlet weak var descriptionEvent: UITextField!
    
    var typesEv: [TypeEvenement]? = nil
    var posType: Int? = nil
    var typesEvenement: [String]?

    // MARK: - Vérifier que le formulaire est conforme
    @IBAction func addEvent(_ sender: Any) {
        let inputs:[String: UITextField] = ["dateEvent": dateEvent,"typeEvent": typeEvent]
        if(FormValidatorHelper.validateForm(inputs)){
            saveNewEvent(withDate: dateEvent.getDate()!, withDescription: descriptionEvent.text)
            DialogBoxHelper.alert(view: self, WithTitle: "Ajout réussi", andMessage: "Evenement ajouté", closure: { (action) in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePatient") as! HomePatientViewController
                self.present(vc, animated: true, completion: nil)
            })
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
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
            typesEv = try TypeEvenement.getAll()
            typesEvenement = typesEv?.map{return $0.libelleTypeEvenement!}
        }catch{
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Fermer le clavier
    func donePressed(){
        typeEvent.resignFirstResponder()
    }
    
    // MARK: - Enregistrer le nouvel évenement
    func saveNewEvent(withDate date: NSDate, withDescription description: String?){
        let type: TypeEvenement = self.typesEv![self.posType!]
        do{
            let _ = try Evenement.create(withDescription: description, withDate: date, withType: type)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    // MARK: - UIPickerView Delegation
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
        self.posType = row
        typeEvent.text = typesEvenement?[row]
    }
}
