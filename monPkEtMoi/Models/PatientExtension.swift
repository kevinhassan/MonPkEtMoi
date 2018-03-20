//
//  Patient.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension Patient{
    static func create(withAdresse: String, withMail: String, withNom: String, withPrenom: String, withTel: String, withTempsPreparation: Int64, withDateNaissance: NSDate) -> Patient {
        
        let patient = Patient(context: CoreDataManager.context)
        
        patient.adresse = withAdresse
        patient.mail = withMail
        patient.nom = withNom
        patient.prenom = withPrenom
        patient.tel = withTel
        patient.tempsPreparation = withTempsPreparation
        patient.dateNaissance = withDateNaissance
        
        CoreDataManager.save()
        return patient
    }
    
    func edit(withAdresse: String, withMail: String, withNom: String, withPrenom: String, withTel: String, withTempsPreparation: Int64, withDateNaissance: NSDate) {
        self.adresse = withAdresse
        self.mail = withMail
        self.nom = withNom
        self.prenom = withPrenom
        self.tel = withTel
        self.tempsPreparation = withTempsPreparation
        self.dateNaissance = withDateNaissance
    }
    static func get() throws -> Patient? {
        let request: NSFetchRequest<Patient> = Patient.fetchRequest()
        do {
            let patients: [Patient] = try CoreDataManager.context.fetch(request)
            if (patients.count > 0) {
                return patients[0]
            } else {
                return nil
            }
        } catch let error as NSError {
            throw error
        }
    }
    static func exists() throws -> Bool {
        do {
            guard let _: Patient = try self.get() {
                return nil
            }
            return true
        } catch let error as NSError {
            throw error
        }
    }

}
