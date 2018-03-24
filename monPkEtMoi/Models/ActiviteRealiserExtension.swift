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
    static func create(withDate : [NSDate]) throws -> [ActiviteRealisee] {
        let newActiviteRealisee = ActiviteRealisee(context: CoreDataManager.context)
        var activiteRTab : [ActiviteRealisee]? = nil
        for element in withDate{
            
            newActiviteRealisee.dateActivite = element
            newActiviteRealisee.estRealise = false
        
            do{
                try CoreDataManager.save()
            }catch let error as NSError{
                throw error
            }
            activiteRTab?.append(newActiviteRealisee)
        }
        return activiteRTab!
    }
}
