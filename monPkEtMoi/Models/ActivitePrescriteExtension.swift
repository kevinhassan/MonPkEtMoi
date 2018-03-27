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
            let _ = try newActivitePrescrite.generateActivitesAR()
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
        }catch let error as NSError {
            throw error
        }
    }
    /// Récupérer tous les types `ActivitePrescrite` stockés
    static func getAllComing() throws -> [ActivitePrescrite] {
        let request: NSFetchRequest<ActivitePrescrite> = ActivitePrescrite.fetchRequest()
        let predicate: NSPredicate = NSPredicate(format: "dateFin > %@, NSDate()")
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "dateFin", ascending: true)]
        do {
            let activites: [ActivitePrescrite] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError {
            throw error
        }
    }
    
    
    func generateActivitesAR() throws{
        // générer les activitées à réaliser
        let dates = DateHelper.getDays(dateD: self.dateDebut!, dateF: self.dateFin!)
        for element in dates{
            for date in element!{
                do{
                    let ar = try ActiviteRealisee.create(withDate: date, withAP : self)
                    self.addToEstEffectue(ar)
                    
                }catch let error as NSError{
                    throw error
                }

            }
            
            
        }

    }
}
