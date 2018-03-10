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
    @IBOutlet weak var adresseTF: UITextField!
    @IBOutlet weak var tempsPreparationTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    /// Vérifier que le formulaire est valide
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
    
    
    @IBAction func addPatient(_ sender: UIBarButtonItem)
    {
        let inputs:[String: UITextField] = ["nom": nomTextField,"prenom": prenomTF, "dateNaissance": dateNaissanceTF,"adresse": adresseTF, "tempsPreparation": tempsPreparationTF,"mail": mailTF,"tel": telTF]

        if validateForm(inputs){
            // ajouter patient
            DialogBoxHelper.alert(view: self, WithTitle: "Bienvenue", andMessage: "Votre compte a été enregistré avec succès")
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    
    func saveNewPatient(withName nom: String, withPrenom prenom: String, withDate date: Date, withAdress adresse : String, withTempsP tempsP : Int){
    
        let patient = Patient(context : CoreDataManager.context)
        //then modify its name
        patient.nom = nom
        patient.prenom = prenom
//        patient.dateNaissance = date
        patient.adresse = adresse
//        patient.tempsPreparation = tempsP
        CoreDataManager.save()
    }
}
