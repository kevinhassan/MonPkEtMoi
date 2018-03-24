//
//  RDVExtention.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//


import Foundation
import CoreData

// MARK: -
/**
 Type RDV
 
 **donner**: RDV -> TypeSoignant
 **dateRDV**: RDV -> NSDate
 **descriptionRDV**: RDV -> String?
 **heureRDV**: RDV -> NSDate
 **lieuRDV**: RDV -> String
 */
extension RDV{
    /// Initialiser une `RDV`
    ///
    /// - Parameters:
    ///   - withTypeSoignant: `Int16` type de soignant du `RDV`
    ///   - withDateRDV:  `NSDate` date du `RDV`
    ///   - withDescription: `String?` description `RDV`
    ///   - withHeureRDV: `NSDate` heure du `RDV`
    ///   - withLieuRDV: `String?` lieu du `RDV`
    static func create(withTypeSoignant : TypeSoignant,withDateRDV: NSDate, withDescription: String?, withHeureRDV: NSDate, withLieuRDV: String?) throws -> RDV {
        let newRDV = RDV(context: CoreDataManager.context)
        newRDV.dateRDV = withDateRDV
        newRDV.descriptionRDV = withDescription
        newRDV.heureRDV = withHeureRDV
        newRDV.lieuRDV = withLieuRDV
        newRDV.donner = withTypeSoignant
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return newRDV
    }
    /// Récupérer tous les types `RDV` sans condition
    static func getAll() throws -> [RDV] {
        let request: NSFetchRequest<RDV> = RDV.fetchRequest()
        do {
            let rdvs: [RDV] = try CoreDataManager.context.fetch(request)
            return rdvs
        } catch let error as NSError {
            throw error
        }
    }
    /// Supprimer un `RDV`
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    // Récupére tous les types `RDV` dont la date n'est pas encore passée
    static func getAllComing() throws -> [RDV]{
        let request: NSFetchRequest<RDV> = RDV.fetchRequest()
        let predicate: NSPredicate = NSPredicate(format: "dateRDV > %@", NSDate())
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "dateRDV", ascending: true)]
        do {
            let rdvs: [RDV] = try CoreDataManager.context.fetch(request)
            return rdvs
        } catch let error as NSError {
            throw error
        }
    }
    
    
}
