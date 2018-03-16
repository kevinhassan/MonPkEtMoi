//
//  editPatientViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 13/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class EditPatientViewController: UITableViewController{
    
    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var prenomTF: UITextField!
    @IBOutlet weak var dateNaissanceTF: DatePicker!
    @IBOutlet weak var adresseTF: UITextField!
    @IBOutlet weak var tempsPreparationTF: CountDownPicker!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    
    var patient:Patient?
    let patientDAO = CoreDataDAOFactory.getInstance().getPatientDAO()

    func initEditFormPatient(patient: Patient)-> Void{
        nomTF.text = patient.nom
        prenomTF.text = patient.prenom
        adresseTF.text = patient.adresse
        telTF.text = patient.tel
        mailTF.text = patient.mail
        dateNaissanceTF.setDate(date: patient.dateNaissance!)
        tempsPreparationTF.text = String(patient.tempsPreparation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            patient = try patientDAO.get()
            initEditFormPatient(patient: patient!)
        }catch{
            fatalError("Error happen")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func updatePatient(_ sender: Any) {
        patient?.nom =  nomTF.text
        patient?.prenom = prenomTF.text
        patient?.adresse = adresseTF.text
        patient?.tel = telTF.text
        patient?.mail = mailTF.text
        patient?.dateNaissance = dateNaissanceTF.getDate()
        patient?.tempsPreparation = Int64(tempsPreparationTF.text!)!
        let inputs:[String: UITextField] = ["nom": nomTF,"prenom": prenomTF, "dateNaissance": dateNaissanceTF,"adresse": adresseTF, "tempsPreparation": tempsPreparationTF,"mail": mailTF,"tel": telTF]
        if(FormValidatorHelper.validateForm(inputs)){
            do{
                try patientDAO.update(patient: patient!)
                DialogBoxHelper.alert(view: self, WithTitle: "Mise à jours", andMessage: "Mise à jours du profil réussie", closure: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
            }catch let error as NSError{
                DialogBoxHelper.alert(view: self, error: error)
            }
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
}
