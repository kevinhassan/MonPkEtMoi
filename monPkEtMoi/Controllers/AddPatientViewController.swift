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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    // MARK: - Formulaire à envoyer s'il est conforme
    @IBAction func addPatient(_ sender: UIBarButtonItem)
    {
        let inputs:[String: UITextField] = ["nom": nomTextField,"prenom": prenomTF, "dateNaissance": dateNaissanceTF,"adresse": adresseTF, "tempsPreparation": tempsPreparationTF,"mail": mailTF,"tel": telTF]
        
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
        let daoF = CoreDataDAOFactory.getInstance()
        let patientDAO = daoF.getPatientDAO()
        let newPatient: PatientModel = PatientModel(adresse: adresse, nom: nom, prenom: prenom, tel: tel, mail: mail, dateNaissance: date, tempsPreparation: tempsP)
        do{
            try patientDAO.create(obj: newPatient)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
}
