//
//  Patient.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class Patient{
    private let dao: PatientDAO
    
    private var nom: String{
        return self.dao.nom!
    }
    private var prenom: String{
        return self.dao.prenom!
    }
    private var dateNaissance: NSDate{
        return self.dao.dateNaissance!
    }
    private var mail: String{
        return self.dao.mail!
    }
    private var adresse: String{
        return self.dao.adresse!
    }
    private var tempsPreparation: Int{
        return Int(self.dao.tempsPreparation)
    }
    private var tel: String{
        return self.dao.tel!
    }
    
    init(nom: String, prenom: String, dateNaissance: NSDate, adresse: String, tempsPreparation: Int, mail: String, tel: String){
        guard let dao = PatientDAO.get() else {
            fatalError("Unable to get dao for patient")
        }
        self.dao = dao
        self.dao.nom = nom
        self.dao.prenom = prenom
        self.dao.dateNaissance = dateNaissance
        self.dao.adresse = adresse
        self.dao.tempsPreparation = Int64(tempsPreparation)
        self.dao.mail = mail
        self.dao.tel = tel
    }
}
