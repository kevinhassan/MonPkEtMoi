//
//  CoreDataPatientDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataPatientDAO: PatientDAO{
    private let entityName: String = "Patient"
    private let dao: Patient
    
    init(){
        self.dao = Patient(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func create(obj: PatientModel) -> Bool{
        self.dao.nom = obj.nom
        self.dao.prenom = obj.prenom
        self.dao.tel = obj.tel
        self.dao.mail = obj.mail
        self.dao.dateNaissance = obj.dateNaissance
        self.dao.tempsPreparation = obj.tempsPreparation
        return true
    }
    func delete(obj: PatientModel) -> Bool {
        return true
    }
    func update(obj: PatientModel) -> Bool {
        return true
    }
    func find() -> PatientModel? {
        return nil
    }
}
