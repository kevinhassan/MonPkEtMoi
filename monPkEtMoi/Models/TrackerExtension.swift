//
//  TrackerExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Tracker
 
 **heureDebut**: Tracker -> NSDate
 **heureFin**: Tracker -> NSDate
 **intervalle**: Patient -> Int16
 */
extension Tracker{
    /// Initialiser un `Tracker`
    ///
    /// - Parameters:
    ///   - withHeureDebut: `NSDate` heure début du `Tracker`
    ///   - withHeureFin:  `NSDate` heure fin du `Tracker`
    ///   - withIntervalle: `Int16` intervalle de minutes pour `Tracker`
    ///   - withPatient: `Patient` concerné par le `Tracker`
    static func create(withHeureDebut: NSDate, withHeureFin: NSDate, withPatient: Patient, withIntervalle: Int16) throws -> Tracker {
        
        let tracker = Tracker(context: CoreDataManager.context)
        
        /// heure début du tracker
        tracker.heureDebut = withHeureDebut
        /// heure fin du tracker
        tracker.heureFin = withHeureFin
        /// intervalle de minutes du tracker
        tracker.intervalle = withIntervalle
        /// Tracker pour le patient
        tracker.concernePatient = withPatient
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return tracker
    }
    /// Editer les informations du `Tracker`
    ///
    /// - Parameters:
    ///   - withHeureDebut: `NSDate` heure début du `Tracker`
    ///   - withHeureFin:  `NSDate` heure fin du `Tracker`
    ///   - withIntervalle: `Int16` intervalle de minutes pour `Tracker`
    func edit(withHeureDebut: NSDate, withHeureFin: NSDate, withIntervalle: Int16) throws {
        /// heure début du tracker
        self.heureDebut = withHeureDebut
        /// heure fin du tracker
        self.heureFin = withHeureFin
        /// intervalle de minutes du tracker
        self.intervalle = withIntervalle
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }

}
