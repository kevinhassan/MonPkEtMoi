//
//  patientModel.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit
import Foundation

extension PatientDAO {
    static func existPatient() throws -> Bool {
        do{
            guard ((try self.get()) != nil) else{
                return false
            }
            return true
        }catch let error as NSError{
            throw error
        }
    }
    static func get() -> PatientDAO? {
        let context = CoreDataManager.context
        guard let entity = NSEntityDescription.entity(forEntityName: "PatientDAO", in: context) else {
            return nil
        }
        let patient = PatientDAO(entity: entity, insertInto: context)
        return patient
    }
}

