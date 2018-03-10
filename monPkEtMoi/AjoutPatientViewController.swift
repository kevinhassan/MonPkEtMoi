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
            saveNewPatient(inputs)
            DialogBoxHelper.alert(view: self, WithTitle: "Bienvenue", andMessage: "Votre compte a été enregistré avec succès")
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    // MARK: - Enregistrer les informations du patient
    
    func saveNewPatient(_ inputs: [String: UITextField]){
        // TODO: mapper les keys pour sauvegarder le contexte
        
        let patient = Patient(context : CoreDataManager.context)
        // inputs.map((key,value) in patient.key = value)
        print(patient)
        //CoreDataManager.save()
    }
}
