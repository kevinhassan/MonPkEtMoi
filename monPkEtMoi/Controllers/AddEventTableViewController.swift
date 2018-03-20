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

    // MARK: - Vérifier que le formulaire est conforme
    @IBAction func addEvent(_ sender: Any) {
        let inputs:[String: UITextField] = ["dateEvent": dateEvent,"typeEvent": typeEvent]
        if(FormValidatorHelper.validateForm(inputs)){
            saveNewEvent(withDate: dateEvent.getDate()!, withDescription: descriptionEvent.text ?? "")
            DialogBoxHelper.alert(view: self, WithTitle: "Ajout réussi", andMessage: "Evenement ajouté", closure: { (action) in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePatient") as! HomePatientViewController
                self.present(vc, animated: true, completion: nil)
            })
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    var typesEvenement: [String]?
    var typesEvent: [TypeEvenementModel]?
    var pos: Int?
    
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
            typesEvent = try typeEventDAO.get()
             typesEvenement = typesEvent!.map({ (type: TypeEvenementModel) -> String in
                return type.libelleTypeEvenement
             })
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
    func saveNewEvent(withDate date: NSDate, withDescription description: String){
        let newEvent: EvenementModel = EvenementModel(dateEvenement: date, descriptionEvenement: description, typeEvenement: typesEvent![pos!])
        do{
            try eventDAO.create(obj: newEvent)
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
        pos = row
        typeEvent.text = typesEvenement?[row]
    }
}
