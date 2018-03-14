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

extension Patient {
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
    static func get() throws -> Patient? {
        let request: NSFetchRequest = Patient.fetchRequest()
        do {
            let patients: [Patient] = try CoreDataManager.context.fetch(request)
            
            return patients.first
        } catch let error as NSError {
            throw error
        }
    }
}

