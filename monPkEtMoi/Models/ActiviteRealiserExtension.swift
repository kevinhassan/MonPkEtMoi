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
    
    static func getAllComing(activitePrescrite : ActivitePrescrite) throws -> [ActiviteRealisee] {
        
        let predicate: NSPredicate = NSPredicate(format: "concerneActivite == %@ AND estRealise == %@ ",activitePrescrite,false as CVarArg,DateHelper.startOfDay(day: NSDate()),DateHelper.endOfDay(day: NSDate()))
        let request: NSFetchRequest<ActiviteRealisee> = ActiviteRealisee.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "dateFin", ascending: true)]
        do {
            let activites: [ActiviteRealisee] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError {
            throw error
        }
    }

}
