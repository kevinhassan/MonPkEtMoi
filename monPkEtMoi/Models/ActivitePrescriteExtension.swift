//
//  ActivitePrescriteExtension.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type ActivitePrescrite
 
 **dureeActivite**: ActivitePrescrite -> Int16
 **libelleActivite**: ActivitePrescrite -> String
 **dateDebut**: ActivitePrescrite -> NSDate
 **dateFin**: ActivitePrescrite -> NSDate
 */
extension ActivitePrescrite{
    /// Initialiser une `ActivitePrescrite`
    ///
    /// - Parameters:
    ///   - withDuree: `Int16` durée de l' `ActivitePrescrite`
    ///   - withDateD:  `NSDate` date début de l' `ActivitePrescrite`
    ///   - withDateF: `NSDate` date fin de l' `ActivitePrescrite`
    ///   - withType: `String` type de l' `ActivitePrescrite`
    static func create(withDuree: Int16, withDateD: NSDate, withDateF: NSDate, withType: String) throws -> ActivitePrescrite {
        let newActivitePrescrite = ActivitePrescrite(context: CoreDataManager.context)
        newActivitePrescrite.dateFin = withDateF
        newActivitePrescrite.dateDebut = withDateD
        newActivitePrescrite.dureeActivite = withDuree
        newActivitePrescrite.libelleActivite = withType
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return newActivitePrescrite
    }
    /// Récupérer tous les types `ActivitePrescrite` stockés
    static func getAll() throws -> [ActivitePrescrite] {
        let request: NSFetchRequest<ActivitePrescrite> = ActivitePrescrite.fetchRequest()
        do {
            let activites: [ActivitePrescrite] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError {
            throw error
        }
    }
    /// Supprimer l'activité prescrite
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
