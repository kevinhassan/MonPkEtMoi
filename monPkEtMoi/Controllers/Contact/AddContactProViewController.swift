//
//  AddContactProViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddContactProViewController: UITableViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var prenomTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var typeSoignantTF: UITextField!

    var newContactPro: ContactPro? = nil
    var typesSoignants : [TypeSoignant] = []
    var posSoignant: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        typeSoignantTF.inputAccessoryView = toolbar
        typeSoignantTF.inputView = typePicker
        
        do{
            typesSoignants = try TypeSoignant.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Fermer le clavier
    func donePressed(){
        typeSoignantTF.resignFirstResponder()
    }
    
    // MARK: - UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesSoignants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesSoignants[row].libelleTypeSoignant
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        posSoignant = row
        typeSoignantTF.text = typesSoignants[pickerView.selectedRow(inComponent: 0)].libelleTypeSoignant!
    }
    
    @IBAction func addContactPro(_ sender: Any) {
        let inputs: [String: UITextField] = ["nom": nomTF,"prenom":prenomTF,"mail":mailTF,"tel":telTF, "typeSoignant": typeSoignantTF]
        if FormValidatorHelper.validateForm(inputs){
            do{
                newContactPro = try ContactPro.create(withMail: mailTF.text!, withNom: nomTF.text!, withPrenom: prenomTF.text!, withTel: telTF.text!, withTypeSoignant: typesSoignants[posSoignant!])
                DialogBoxHelper.alert(view: self, WithTitle: "Ajout du contact", andMessage: "Ajouté avec succès", closure: {(action) in
                    self.performSegue(withIdentifier: "showListContactPro", sender: self)
                })
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Ajout du contact échoué")
            }
            
        }else{
            DialogBoxHelper.alert(view: self, WithTitle: "Erreur", andMessage: "Données du formulaire invalides", closure: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowContactsProViewController
        destinationVC.contactsPro.append(newContactPro!)
    }
}
