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
 
 **date**: Tracker -> NSDate
 **etat**: Tracker -> Etat
 */
extension Tracker{
    /// Initialiser un `Tracker`
    ///
    /// - Parameters:
    ///   - withDate: date où le patient a relevé son état `NSDate`
    ///   - withEtat: etat du patient au moment du relevé `String`
    static func create(withDate: NSDate, withEtat: Etat) throws -> Tracker {
        
        let tracker = Tracker(context: CoreDataManager.context)
        
        /// date du tracker
        tracker.date = withDate
        /// etat du patient
        tracker.avoirEtat = withEtat
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return tracker
    }
    /// Récupérer tous les états sur 5 jours avant la date actuelle
    static func getAll() throws -> [Tracker]{
        let date = Calendar.current.date(byAdding: .day, value: -5, to: Date())
        let predicate: NSPredicate = NSPredicate(format: "date > %@ AND date < %@", date! as NSDate, NSDate())
        let request: NSFetchRequest<Tracker> = Tracker.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        do{
            let trackers: [Tracker] = try CoreDataManager.context.fetch(request)
            return trackers
        }catch let error as NSError{
            throw error
        }
    }
}
