//
//  PatientModel.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class PatientModel{
    
    var adresse: String
    var nom: String
    var prenom: String
    var tel: String
    var mail: String
    var dateNaissance: NSDate
    var tempsPreparation: Int64
    
    init(adresse: String, nom: String, prenom: String, tel: String, mail: String, dateNaissance: NSDate, tempsPreparation: Int64){
        self.adresse = adresse
        self.nom = nom
        self.prenom = prenom
        self.tel = tel
        self.mail = mail
        self.dateNaissance = dateNaissance
        self.tempsPreparation = tempsPreparation
    }
    
}
