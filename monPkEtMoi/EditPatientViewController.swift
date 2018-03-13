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
    @IBOutlet weak var tempsPreparationTF: TimePicker!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    
    func initEditFormPatient()-> Void{
        do{
            let patient: Patient = try Patient.get()!
            nomTF.text = patient.nom
            prenomTF.text = patient.prenom
            adresseTF.text = patient.adresse
            telTF.text = patient.tel
            mailTF.text = patient.mail
            dateNaissanceTF.setDate(date: patient.dateNaissance!)
            tempsPreparationTF.text = String(patient.tempsPreparation)
            
        }catch{
            fatalError("Error accured")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initEditFormPatient()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
