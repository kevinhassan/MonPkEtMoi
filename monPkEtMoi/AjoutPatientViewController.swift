//
//  AjoutPatientViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit
import CoreData
class AjoutPatientViewController: UITableViewController {

    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var prenomTF: UITextField!
    @IBOutlet weak var dateNaissanceTF: DatePicker!
    @IBOutlet weak var tempsPreparationTF: TimePicker!
    @IBOutlet weak var adresseTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    // MARK: - Valider données formulaire
    func validateForm(_ inputs: [String: UITextField])-> Bool {
        // Filtrer les valeurs optionnelles (textField vide)
        let res = inputs.filter{(key, input) in !(input.text?.isEmpty ?? true)}
        // Si même taille alors pas de valeurs vides
        return res.count == (inputs.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - Formulaire à envoyer
    @IBAction func addPatient(_ sender: UIBarButtonItem)
    {
        let inputs:[String: UITextField] = ["nom": nomTextField,"prenom": prenomTF, "dateNaissance": dateNaissanceTF,"adresse": adresseTF, "tempsPreparation": tempsPreparationTF,"mail": mailTF,"tel": telTF]

        if validateForm(inputs){
            //withDate: inputs["dateNaissance"]?.text
            saveNewPatient(withName: inputs["nom"]!.text!, withPrenom: (inputs["prenom"]?.text)!, withAdress : (inputs["adresse"]?.text)!, withTempsP: Int((inputs["tempsPreparation"]?.text)!)!, withMail: (inputs["mail"]?.text)!, withTel:  (inputs["tel"]?.text)!)
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    // MARK: - Enregistrer les informations du patient
    
    func saveNewPatient(withName nom: String, withPrenom prenom: String,  withAdress adresse : String, withTempsP tempsP : Int, withMail mail: String, withTel tel: String){
        //withDate date: Date
        let patient: Patient = Patient(context : CoreDataManager.context)
        
        CoreDataManager.save()
    }
}
