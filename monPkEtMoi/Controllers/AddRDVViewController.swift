//
//  AddRDVViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddRDVViewController: UITableViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dateRDV: DatePicker!
    
    @IBOutlet weak var typeSoignant: UITextField!
    
    @IBOutlet weak var nomSoignant: UITextField!
    
    @IBOutlet weak var descriptionRDV: UITextField!
    
    var typesSoignants : [TypeSoignant] = []
    var nomsSoignants : [Soignant] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        typeSoignant.inputAccessoryView = toolbar
        typeSoignant.inputView = typePicker
        
        do{
            typesSoignants = try TypeSoignant.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
        dateRDV.setDate(date: NSDate())
    }
    
    // MARK: - Fermer le clavier
    func donePressed(){
        typeSoignant.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return typesSoignants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return typesSoignants[row].libelleTypeSoignant
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeSoignant.text = typesSoignants[pickerView.selectedRow(inComponent: 0)].libelleTypeSoignant!
    }
    
    //MARK: - Sauvegarder la posologie si le formulaire est valide
    //TODO: Vérifier que le formulaire n'est pas vide pour les heures de prises
    @IBAction func saveRDV(_ sender: Any) {
        do{
            let _ = try RDV.create(withDateRDV: dateRDV.getDate(), withDescription: descriptionRDV.description, withHeureRDV: heureRDV.getDate(), withLieuRDV: lieuRDV.description)
            DialogBoxHelper.alert(view: self, WithTitle: "Rendez-vous ajouté", andMessage: "Ajout avec succès", closure: {(action) in
                self.performSegue(withIdentifier: "unwindFromAddRDV", sender: self)
            })
        } catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    
}
