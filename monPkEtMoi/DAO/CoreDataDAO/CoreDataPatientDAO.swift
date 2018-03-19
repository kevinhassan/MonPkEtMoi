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
    private let context: NSManagedObjectContext
    
    init(){
        self.context = CoreDataManager.context
    }
    func create(obj: PatientModel) -> Bool{
        var patient: Patient = Patient(context: self.context)
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
