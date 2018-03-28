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
 Type ActiviteRealisee
 
 **date**: ActiviteRealisee -> NSDate
 */
extension ActiviteRealisee{
    /// Initialiser une `ActivitePrescrite`
    ///
    /// - Parameters:
    ///   - withDuree: `Int16` durée de l' `ActiviteRealisee`
    ///   - withPrescrit:  `ActivitePrescrite` date début de l' `ActiviteRealisee`
    ///   - withDateF: `NSDate` date fin de l' `ActiviteRealisee`
    ///   - withType: `String` type de l' `ActiviteRealisee`
    static func create(withDate : NSDate, withPrescrit: ActivitePrescrite) throws -> ActiviteRealisee {
        let newActiviteRealisee = ActiviteRealisee(context: CoreDataManager.context)
        newActiviteRealisee.dateActivite = withDate
        newActiviteRealisee.estRealise = false
        newActiviteRealisee.concerneActivite = withPrescrit
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return newActiviteRealisee
    }
}
