//
//  RDVExtention.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//


import Foundation
import CoreData

extension RDV{
    static func create(withDateRDV: NSDate, withDescription: String, withHeureRDV: NSDate, withLieuRDV: String) throws -> RDV {
        let newRDV = RDV(context: CoreDataManager.context)
        newRDV.dateRDV = withDateRDV
        newRDV.descriptionRDV = withDescription
        newRDV.heureRDV = withHeureRDV
        newRDV.lieuRDV = withLieuRDV
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return newRDV
    }
    
    static func getAll() throws -> [RDV] {
        let request: NSFetchRequest<RDV> = RDV.fetchRequest()
        do {
            let rdvs: [RDV] = try CoreDataManager.context.fetch(request)
            return rdvs
        } catch let error as NSError {
            throw error
        }
    }
    
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
    
}
