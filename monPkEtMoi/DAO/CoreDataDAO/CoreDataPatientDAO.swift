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
    func create(obj: PatientModel) throws{
        self.dao.nom = obj.nom
        self.dao.prenom = obj.prenom
        self.dao.tel = obj.tel
        self.dao.mail = obj.mail
        self.dao.dateNaissance = obj.dateNaissance
        self.dao.tempsPreparation = obj.tempsPreparation
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: PatientModel) throws {
    }
    func update(obj: PatientModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() -> PatientModel? {
        return nil
    }
    func getOne() throws -> PatientModel? {
        do{
            guard let patients: [Patient] = try self.getAll() else{
                return nil
            }
            let patient: PatientModel = PatientModel(adresse: (patients.first?.adresse)!, nom: (patients.first?.nom)!, prenom: (patients.first?.prenom)!, tel: (patients.first?.tel)!, mail: (patients.first?.mail)!, dateNaissance: (patients.first?.dateNaissance)!, tempsPreparation: (patients.first?.tempsPreparation)!)
            return patient
        }catch let error as NSError{
            throw error
        }
    }
    
    func getAll() throws -> [Patient]? {
        let request: NSFetchRequest<Patient> = NSFetchRequest(entityName: self.entityName)
        do{
            let patients:[Patient] = try self.dao.managedObjectContext!.fetch(request)
            return patients
        }catch let error as NSError{
            throw error
        }
    }
    
    func exist() throws -> Bool {
        do{
            guard let _: PatientModel = try self.getOne() else {
                return false
            }
            return true
        }catch let error as NSError{
            throw error
        }
    }
}
