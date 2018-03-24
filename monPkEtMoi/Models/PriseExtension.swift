//
//  PriseExtension.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Prise
 
 **estPris**: Prise -> Boolean
 **heurePrise**: Prise -> NSDate
 **concernePosologie**: Prise -> Posologie
 */
extension Prise{
    /// Initialiser une `Prise`
    ///
    /// - Parameters:
    ///   - withHeurePrise:  `NSDate` heure du type `Prise`
    ///   - withPosologie: `Posologie` posologie concerné par le type `Prise`
    static func create(withHeurePrise: NSDate, withPosologie: Posologie) throws -> Prise {
        let prise = Prise(context:CoreDataManager.context)
        prise.heurePrise = withHeurePrise
        prise.concernePosologie = withPosologie
        prise.estPris = false
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return prise
    }
}
