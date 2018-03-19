//
//  PatientModel.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class PatientModel{
    
    private var adresse: String
    private var nom: String
    private var prenom: String
    private var tel: String
    private var mail: String
    private var dateNaissance: NSDate
    private var tempsPreparation: Int16
    
    init(adresse: String, nom: String, prenom: String, tel: String, mail: String, dateNaissance: NSDate, tempsPreparation: Int16){
        self.adresse = adresse
        self.nom = nom
        self.prenom = prenom
        self.tel = tel
        self.mail = mail
        self.dateNaissance = dateNaissance
        self.tempsPreparation = tempsPreparation
    }
    
}
