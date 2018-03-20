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
    internal static let instance: CoreDataPatientDAO = CoreDataPatientDAO()
    
    private init(){}
    
    func get() throws -> Patient? {
        do{
            guard let patients: [Patient] = try self.getAll() else{
                return nil
            }
            return patients.first
        }catch let error as NSError{
            throw error
        }
    }
    
    func getAll() throws -> [Patient]? {
        let request: NSFetchRequest<Patient> = NSFetchRequest(entityName: self.entityName)
        do{
            let patients:[Patient] = try CoreDataManager.context.fetch(request)
            return patients
        }catch let error as NSError{
            throw error
        }
    }
    
    func exist() throws -> Bool {
        do{
            guard let _: Patient = try self.get() else {
                return false
            }
            return true
        }catch let error as NSError{
            throw error
        }
    }
    
    func update(patient: Patient) throws  {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
    func create() -> Patient{
        return Patient(context: CoreDataManager.context)
    }
    
    func save(patient: Patient) throws {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
