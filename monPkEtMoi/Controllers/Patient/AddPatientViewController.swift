//
//  AjoutPatientViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit
import CoreData
class AddPatientViewController: UITableViewController {

    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var prenomTF: UITextField!
    @IBOutlet weak var dateNaissanceTF: DatePicker!
    @IBOutlet weak var tempsPreparationTF: CountDownPicker!
    @IBOutlet weak var adresseTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var heureDebutTracker: TimePicker!
    @IBOutlet weak var heureFinTracker: TimePicker!
    @IBOutlet weak var intervalleTracker: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    // MARK: - Formulaire à envoyer s'il est conforme
    @IBAction func addPatient(_ sender: UIBarButtonItem)
    {
        let inputs:[String: UITextField] = ["nom": nomTextField,"prenom": prenomTF, "dateNaissance": dateNaissanceTF,"adresse": adresseTF, "tempsPreparation": tempsPreparationTF,"mail": mailTF,"tel": telTF,"heureDebutTracker": heureDebutTracker,"heureFinTracker":heureFinTracker,"intervalleTracker": intervalleTracker]
        
        if FormValidatorHelper.validateForm(inputs){
            let dateF:NSDate = ((dateNaissanceTF))!.getDate()!
            saveNewPatient(withName: nomTextField.text!, withPrenom: prenomTF.text!, withDate: dateF,withAdress : adresseTF.text!, withTempsP: Int64(tempsPreparationTF.text!)!, withMail: mailTF.text!, withTel:  telTF.text!)
            DialogBoxHelper.alert(view: self, WithTitle: "Bienvenue", andMessage: "Le compte a été créé avec succès", closure: {(action)->() in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
                self.present(vc, animated: true, completion: nil)})
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    // MARK: - Enregistrer les informations du patient
    func saveNewPatient(withName nom: String, withPrenom prenom: String, withDate date: NSDate, withAdress adresse : String, withTempsP tempsP : Int64, withMail mail: String, withTel tel: String) {
        do{
            let patient: Patient  = try Patient.create(withAdresse: adresse, withMail: mail, withNom: nom, withPrenom: prenom, withTel: tel, withTempsPreparation: tempsP, withDateNaissance: date)
            try saveNewTracker(withHeureDebut: heureDebutTracker.getDate()!, withHeureFin: heureFinTracker.getDate()!, withIntervalle: Int16(intervalleTracker.text!)!, withPatient: patient)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    func saveNewTracker(withHeureDebut: NSDate, withHeureFin: NSDate, withIntervalle: Int16, withPatient: Patient) throws{
        do{
            let _: Tracker = try Tracker.create(withHeureDebut: withHeureDebut, withHeureFin: withHeureFin, withPatient: withPatient, withIntervalle: withIntervalle)
        }catch let error as NSError{
            throw error
        }
    }
}
