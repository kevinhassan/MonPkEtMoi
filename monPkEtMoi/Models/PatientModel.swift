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
    {
        get{
            return self.adresse
        }
        set{
            self.adresse = newValue
        }
    }
    private var nom: String
    {
        get{
            return self.nom
        }
        set{
            self.nom = newValue
        }
    }
    private var prenom: String
    {
        get{
            return self.prenom
        }
        set{
            self.prenom = newValue
        }
    }
    private var tel: String
    {
        get{
            return self.tel
        }
        set{
            self.tel = newValue
        }
    }
    private var mail: String
    {
        get{
            return self.mail
        }
        set{
            self.mail = newValue
        }
    }
    private var dateNaissance: NSDate
    {
        get{
            return self.dateNaissance
        }
        set{
            self.dateNaissance = newValue
        }
    }
    private var tempsPreparation: Int16
    {
        get{
            return self.tempsPreparation
        }
        set{
            self.tempsPreparation = newValue
        }
    }
    
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
