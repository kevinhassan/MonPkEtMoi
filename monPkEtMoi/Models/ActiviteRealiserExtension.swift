//
//  ActiviteRealiserExtension.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 24/03/2018.
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
extension ActiviteRealisee{
    /// Initialiser une `ActivitePrescrite`
    ///
    /// - Parameters:
    ///   - withDuree: `Int16` durée de l' `ActivitePrescrite`
    ///   - withDateD:  `NSDate` date début de l' `ActivitePrescrite`
    ///   - withDateF: `NSDate` date fin de l' `ActivitePrescrite`
    ///   - withType: `String` type de l' `ActivitePrescrite`
    static func create(withDate : NSDate, withAP : ActivitePrescrite) throws -> ActiviteRealisee {
        let newActiviteRealisee = ActiviteRealisee(context: CoreDataManager.context)
        newActiviteRealisee.dateActivite = withDate
        newActiviteRealisee.estRealise = false
        newActiviteRealisee.concerneActivite = withAP
        
            do{
                try CoreDataManager.save()
            }catch let error as NSError{
                throw error
            }
        return newActiviteRealisee
    }
    
    
    
    /// Récupère toute les activité réalisée concernées par l'activité prescrite
    ///
    /// - Parameter activitePrescrite: activitePrescrite à laquelle appartient l'activtePrescrite
    /// - Returns: renvoi la collection d'activite réalisée qui appartient a l'activité prescrite passée en paramètre
    /// - Throws: error
    static func getAllComing(activitePrescrite : ActivitePrescrite) throws -> [ActiviteRealisee] {
        
        let predicate: NSPredicate = NSPredicate(format: "concerneActivite == %@ AND estRealise == %@ ",activitePrescrite,false as CVarArg,DateHelper.startOfDay(day: NSDate()),DateHelper.endOfDay(day: NSDate()))
        let request: NSFetchRequest<ActiviteRealisee> = ActiviteRealisee.fetchRequest()
        request.predicate = predicate
        do {
            let activites: [ActiviteRealisee] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError {
            throw error
        }
    }
    
    
    /// Modifie le booléen validation concernant une activité réalisée et met à jour les attributs
    ///
    /// - Parameters:
    ///   - withDate: 'NSDate' date a laquelle l'activité est réalisée
    ///   - withHeure: 'NSDate' heure à laquelle l'activité est réalisée
    ///   - withDuree: 'Int16' durée éffectuée d'activité
    /// - Throws: error
    func validate(withDate : NSDate, withHeure : NSDate, withDuree : Int16) throws {
        
        self.estRealise = true
        self.dureeRealise = withDuree
        self.heureActivite = withHeure
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        
    }

}
