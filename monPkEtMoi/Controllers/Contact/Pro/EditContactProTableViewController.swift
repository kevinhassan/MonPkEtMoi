//
//  EditContactProTableViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class EditContactProTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var contactPro: ContactPro? = nil
    var specialitesContact:[TypeSoignant] = []
    var posSoignant: Int = 0
    
    
    @IBOutlet weak var nomContact: UITextField!
    @IBOutlet weak var prenomContact: UITextField!
    @IBOutlet weak var mailContact: UITextField!
    @IBOutlet weak var specialiteContact: UITextField!
    @IBOutlet weak var telContact: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomContact.text = contactPro?.nomContact
        prenomContact.text = contactPro?.prenomContact
        mailContact.text = contactPro?.mailContact
        specialiteContact.text = contactPro?.etreDuType?.libelleTypeSoignant
        telContact.text = contactPro?.telContact
        
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        specialiteContact.inputAccessoryView = toolbar
        specialiteContact.inputView = typePicker
        
        do{
            specialitesContact = try TypeSoignant.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    // MARK: - Fermer le clavier
    func donePressed(){
        specialiteContact.text = specialitesContact[posSoignant].libelleTypeSoignant
        specialiteContact.resignFirstResponder()
    }
    
    // MARK: - UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return specialitesContact.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return specialitesContact[row].libelleTypeSoignant
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        posSoignant = row
        specialiteContact.text = specialitesContact[pickerView.selectedRow(inComponent: 0)].libelleTypeSoignant!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editContactPro(_ sender: Any) {
        let inputs: [String:UITextField] = ["nom": nomContact, "prenom": prenomContact,"mail": mailContact, "specialite": specialiteContact, "tel": telContact]
        if FormValidatorHelper.validateForm(inputs){
            do{
                try contactPro?.edit(withMail: mailContact.text!, withNom: nomContact.text!, withPrenom: prenomContact.text!, withTel: telContact.text!, withTypeSoignant: specialitesContact[posSoignant])
                DialogBoxHelper.alert(view: self, WithTitle: "Edition du contact", andMessage: "La mise à jours du contact est effectuée", closure: {(action) in
                    self.performSegue(withIdentifier: "editContactPro", sender: self)
                })
            }catch{
                    DialogBoxHelper.alert(view: self, errorMessage: "Erreur lors de l'ajout du contact professionnel")
            }
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Formulaire invalide")
        }
    }
}
